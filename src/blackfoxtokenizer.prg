*========================================================================*
* Class Tokenizer
*========================================================================*
#include BLACKFOX.H
Define Class BlackFoxTokenizer As Session
*========================================================================*
* Function Init
*========================================================================*
	Function Init
		Set Deleted On
		Set Exact On
		Set Near Off
		This.PopulateCursor()
	Endfunc
*========================================================================*
* Tokenize
*========================================================================*
	Function Tokenize(tcSource As String)
		Local loTokenList As Collection, lnTokenState As Integer, lcLook As Character, lcTokenStr
		loTokenList  = Createobject("Collection")
		lnTokenState = TOKEN_STATE_DEFAULT
		loToken 	 = .Null.
		lcTokenStr	 = ''
		lcStringDelimiter = ''
		For i = 1 To Len(tcSource)
			lcLook = Substr(tcSource, i, 1)
			Do Case
			Case lnTokenState = TOKEN_STATE_DEFAULT
				Do Case
				Case Isdigit(lcLook)
					lnTokenState = TOKEN_STATE_NUMBER
					lcTokenStr   = lcLook
				Case This.IsLetter(lcLook)
					lnTokenState = TOKEN_STATE_WORD
					lcTokenStr   = lcLook
				Case Inlist(lcLook, '"', "'")
					lcStringDelimiter = lcLook
					lnTokenState = TOKEN_STATE_STRING
				Case lcLook == '#'
					lnTokenState = TOKEN_STATE_COMMENT
				Otherwise
				Endcase

			Case lnTokenState = TOKEN_STATE_NUMBER
				If !Isdigit(lcLook)
					loTokenList.Add(Createobject("blackfoxToken", TOKEN_NUMBER, lcTokenStr))
					lcTokenStr = ''
					lnTokenState = TOKEN_STATE_DEFAULT
					i = i - 1
				Else
					lcTokenStr = lcTokenStr + lcLook
				EndIf

			Case lnTokenState = TOKEN_STATE_WORD
				If !This.IsLetter(lcLook)
					lnType = This.FindCommandType(lcTokenStr)
					loTokenList.Add(Createobject("blackfoxToken", lnType, lcTokenStr))
					lcTokenStr = ''
					lnTokenState = TOKEN_STATE_DEFAULT
					i = i - 1
				Else
					lcTokenStr = lcTokenStr + lcLook
				Endif

			Case lnTokenState = TOKEN_STATE_STRING
				If lcLook == lcStringDelimiter
					loTokenList.Add(Createobject("blackfoxToken", TOKEN_STRING, lcTokenStr))
					lcTokenStr = ''
					lnTokenState = TOKEN_STATE_DEFAULT
					lcStringDelimiter = ''
				Else
					lcTokenStr = lcTokenStr + lcLook
				EndIf
			
			Case lnTokenState = TOKEN_STATE_COMMENT
				If InList(lcLook, Chr(13), Chr(10))
					lnTokenState = TOKEN_STATE_DEFAULT
				EndIf
			Otherwise
			Endcase
		Endfor
		Return loTokenList
	Endfunc
*========================================================================*
* Function IsLetter
*========================================================================*
	Function IsLetter(tcLetter)
		Return Between(Asc(tcLetter), Asc('a'), Asc('z')) Or ;
			Between(Asc(tcLetter), Asc('A'), Asc('Z')) Or Asc(tcLetter) = Asc('_')
	Endfunc
*========================================================================*
* Function FindCommandType
*========================================================================*
	Function FindCommandType(tcCommand)
		Dimension aKeyName(1)
		aKeyName[1] = 0
		Select key_type From qKeyword Where Alltrim(key_name) == Lower(tcCommand) Into Array aKeyName
		Return Iif(Empty(aKeyName[1]), TOKEN_WORD, aKeyName[1])
	Endfunc
*========================================================================*
* Function PopulateCursor
*========================================================================*
	Function PopulateCursor
		Create Cursor qKeyword ( key_type i, key_name c(20) )
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_CREATE, 'create')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_CONNECTION, 'connection')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_METHOD, 'method')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_JSON, 'json')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_OBJECT, 'object')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_GET, 'get')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_POST, 'post')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_HTTP, 'http')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_REQUEST, 'request')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_FROM, 'from')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_FOR, 'for')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_FILE, 'file')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_CURSOR, 'cursor')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_IN, 'in')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_SCREEN, 'screen')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_TO, 'to')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_PRINT, 'print')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_URL, 'url')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_ADD, 'add')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_HEADER, 'header')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_VALUE, 'value')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_WITH, 'with')
		Insert Into qKeyword (key_type, key_name) Values (TOKEN_BODY, 'body')
	Endfunc
Enddefine
