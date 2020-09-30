#include BLACKFOX.H
*========================================================================*
* Class Parser
*========================================================================*
Define Class BlackFoxParser As Custom
	Tokens = .Null.
	CurrentToken = .Null.
	NextToken = .Null.
	TokenPosition = 1
	TokenAux = .Null.
	lJSONLoaded = .F.
*========================================================================*
* Function Init
*========================================================================*
	Function Init(toTokens)
		This.TokenAux = Createobject("BlackFoxToken", 0, "")
		This.Tokens = toTokens
	Endfunc
*========================================================================*
* ParseCommand
*========================================================================*
	Function ParseCommand
		Do While This.CurrentToken.Type != TOKEN_NULL
			Do Case
			Case This.CurrentToken.Type = TOKEN_CREATE And This.NextToken.Type = TOKEN_JSON
				If This.lJSONLoaded
					This.ParseJSON()
				Endif
			Case This.CurrentToken.Type = TOKEN_PRINT And This.NextToken.Type = TOKEN_JSON
				If This.lJSONLoaded
					This.PrintJSON()
				Endif
			Case This.CurrentToken.Type = TOKEN_HTTP
				Do Case
				Case This.NextToken.Type = TOKEN_GET
					This.HTTPRequest('GET')
				Case This.NextToken.Type = TOKEN_POST
					This.HTTPRequest('POST')
				Otherwise
					Error "expected GET | POST but found '" + This.printToken(This.NextToken.Type) + "'"
				Endcase
			Otherwise
				Error "unknown command '" + This.printToken() + "'"
			Endcase
		Enddo
	Endfunc
*========================================================================*
* HTTP POST identifier
*	URL 	identifier | string
*	BODY 	identifier | string
*	{ADD 	HEADER identifier | string WITH identifier | string}
*========================================================================*
*========================================================================*
* HTTP GET identifier
*	URL identifier | string
*	{ADD HEADER identifier | string WITH identifier | string}
*========================================================================*
	Function HTTPRequest(tcMethod As String)
		Local llPost As Boolean, lcBody As String
		
		llPost = (tcMethod == 'POST')
		lcBody = ''
		
		This.MatchAndEat(TOKEN_HTTP)
		This.MatchAndEat(Iif(llPost, TOKEN_POST, TOKEN_GET))
		
		lcHttpObj = This.CurrentToken.Value
		This.MatchAndEat(TOKEN_WORD)
		This.MatchAndEat(TOKEN_URL)
		lcURL = This.GetStringOrIdentifier()
		
		Public &lcHttpObj
		&lcHttpObj = This.CreateHTTP()
		loHttp = &lcHttpObj
		loHttp.Open(tcMethod, lcURL)
		
		If llPost
			This.MatchAndEat(TOKEN_BODY)
			lcBody = This.GetStringOrIdentifier()
		EndIf
		
		Do while This.CurrentToken.Type = TOKEN_ADD
			This.MatchAndEat(TOKEN_ADD)
			This.MatchAndEat(TOKEN_HEADER)
			lcHeader = This.GetStringOrIdentifier()
			This.MatchAndEat(TOKEN_WITH)
			lcValue = This.GetStringOrIdentifier()
			loHttp.setRequestHeader(lcHeader, lcValue)
		EndDo
		loHttp.Send(lcBody)
	EndFunc
*========================================================================*
* Function GetStringOrIdentifier
*========================================================================*
	Function GetStringOrIdentifier
		Local lcResult As String
		lcResult = ''
		Do CASE
		Case This.CurrentToken.Type = TOKEN_WORD
			lcResult = Evaluate(This.CurrentToken.Value)
			This.MatchAndEat(TOKEN_WORD)
		Case This.CurrentToken.Type = TOKEN_STRING
			lcResult = This.CurrentToken.Value
			This.MatchAndEat(TOKEN_STRING)
		Otherwise
			Error "expected IDENTIFIER | STRING but found '" + This.PrintToken() + "'"
		EndCase
		Return lcResult
	EndFunc
*========================================================================*
* Function PrintJSON
*========================================================================*
	Function PrintJSON
		This.MatchAndEat(TOKEN_PRINT)
		This.MatchAndEat(TOKEN_JSON)
		This.MatchAndEat(TOKEN_OBJECT)
		loJSONObj = This.CurrentToken.Value

		This.MatchAndEat(TOKEN_WORD)
		lcJSONStr = _Screen.json.Stringify(Evaluate(loJSONObj))

		Do Case
		Case This.CurrentToken.Type = TOKEN_TO And This.NextToken.Type = TOKEN_WORD
			This.MatchAndEat(TOKEN_TO)
			lcVarName = This.CurrentToken.Value
			Public &lcVarName
			&lcVarName = lcJSONStr
			This.MatchAndEat(TOKEN_WORD)

		Case This.CurrentToken.Type = TOKEN_IN And This.NextToken.Type = TOKEN_SCREEN
			This.MatchAndEat(TOKEN_IN)
			This.MatchAndEat(TOKEN_SCREEN)
			?lcJSONStr

		Otherwise
			Error "unknown command '" + This.printToken() + "'"
		Endcase
	Endfunc
*========================================================================*
* Function ParseJSON
* CREATE JSON OBJECT identifier FROM identifier | FILE string | CURSOR identifier | STRING
*========================================================================*
	Function ParseJSON
		Local lcJSONobj
		This.MatchAndEat(TOKEN_CREATE)
		This.MatchAndEat(TOKEN_JSON)
		This.MatchAndEat(TOKEN_OBJECT)
		lcJSONobj = This.CurrentToken.Value
		This.MatchAndEat(TOKEN_WORD)
		This.MatchAndEat(TOKEN_FROM)
		Do Case
		Case This.CurrentToken.Type = TOKEN_STRING
			lcString = This.CurrentToken.Value
			This.MatchAndEat(TOKEN_STRING)
			This.CreateJSONObject(lcJSONobj, lcString)

		Case This.CurrentToken.Type = TOKEN_WORD
			lcVarName = This.CurrentToken.Value
			This.MatchAndEat(TOKEN_WORD)
			This.CreateJSONObject(lcJSONobj, Evaluate(lcVarName))

		Case This.CurrentToken.Type = TOKEN_FILE
			This.MatchAndEat(TOKEN_FILE)
			lcFile = This.CurrentToken.Value
			If File(lcFile)
				This.CreateJSONObject(lcJSONobj, Filetostr(lcFile))
			Else
				Error "file not found '" + lcFile + "'"
			Endif
			This.MatchAndEat(TOKEN_STRING)

		Case This.CurrentToken.Type = TOKEN_CURSOR
			This.MatchAndEat(TOKEN_CURSOR)
			lcCurName = This.CurrentToken.Value
			If Used(lcCurName)
				Dimension aRows(1)
				aRows(1) = .Null.
				nCounter = 0
				Select (lcCurName)
				Scan
					Scatter Name loData Memo
					nCounter = nCounter + 1
					Dimension aRows(nCounter)
					aRows[nCounter] = loData
				Endscan
				Public &lcJSONobj
				&lcJSONobj = Createobject("Empty")
				lcMacro = "AddProperty(" + lcJSONobj + ", '" + lcCurName + "[1]')"
				&lcMacro
				nIndex = 0
				For Each loData In aRows
					nIndex = nIndex + 1
					lcMacro = "DIMENSION " + lcJSONobj + "." + lcCurName + "[" + Alltrim(Str(nIndex)) + "]"
					&lcMacro
					lcMacro = lcJSONobj + "." + lcCurName + "[" + Alltrim(Str(nIndex)) + "] = loData"
					&lcMacro
				Endfor
			Else
				Error "Alias not found '" + lcCurName
			Endif
			This.MatchAndEat(TOKEN_WORD)
		Otherwise
			Error "Syntax error: unknown command '" + This.printToken() + "'"
		Endcase
	Endfunc
*========================================================================*
* CreateJSONObject
*========================================================================*
	Function CreateJSONObject(tcVarName, tcJSONStr)
		Public &tcVarName
		&tcVarName = _Screen.json.Parse(tcJSONStr)
	Endfunc
*========================================================================*
* Function GetToken
*========================================================================*
	Function GetToken(tnPosition)
		Local loToken
		If This.TokenPosition + tnPosition > This.Tokens.Count
			loToken = Createobject("BlackFoxToken", TOKEN_NULL, "NULL")
		Else
			loToken = This.Tokens.Item(This.TokenPosition + tnPosition)
		Endif
		Return loToken
	Endfunc
*========================================================================*
* Function MatchAndEat
*========================================================================*
	Function MatchAndEat(tnToken)
		If This.CurrentToken.Type == tnToken
			This.TokenPosition = This.TokenPosition + 1
		Else
			Error "Parsing Error: unexpected token '" + This.printToken(tnToken) + "'"
		Endif
	Endfunc
*========================================================================*
* CurrentToken_Access
*========================================================================*
	Function CurrentToken_Access
		Return This.GetToken(0)
	Endfunc
*========================================================================*
* NextToken_Access
*========================================================================*
	Function NextToken_Access
		Return This.GetToken(1)
	Endfunc
*========================================================================*
* PrintToken
*========================================================================*
	Function printToken(tnToken)
		tnToken = Evl(tnToken, This.CurrentToken.Type)
		Return This.TokenAux.ToString(tnToken)
	Endfunc
*========================================================================*
* lJSONLoaded_Access
*========================================================================*
	Function lJSONLoaded_Access
		If !_vfp.BlackFoxHandler.JSONFoxLoaded
			Error "JSONFox library needed."
		Endif
		Return .T.
	Endfunc
&& ======================================================================== &&
&& Hidden Function CreateHTTP
&& ======================================================================== &&
	Hidden Function CreateHTTP
		Local lCreated As boolean, loXMLHTTP As Object
		lCreated = .F.
		Try
			loXMLHTTP	= Createobject('Msxml2.ServerXMLHTTP.6.0')
			lCreated = .T.
		Catch
		Endtry
		If !lCreated
			Try
				This.oXMLHTTP	= Createobject('MSXML2.ServerXMLHTTP')
				lCreated = .T.
			Catch
			Endtry
		Endif
		If !lCreated
			Try
				This.oXMLHTTP	= Createobject('Microsoft.XMLHTTP')
				lCreated = .T.
			Catch
			Endtry
		Endif

		If Type('loXMLHTTP') <> 'O'
			Error 'could not create the XMLHTTP object'
		Else
			lCreated = .T.
		Endif
		Return loXMLHTTP
	EndFunc
Enddefine