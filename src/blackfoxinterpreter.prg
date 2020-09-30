*========================================================================*
* Class Interpreter
*========================================================================*
Define Class BlackFoxInterpreter As Custom
*!*	*========================================================================*
*!*	* Function Init
*!*	*========================================================================*
*!*		Function Init
*!*			Set Procedure To 'Tokenizer' Additive
*!*			Set Procedure To 'Parser' Additive
*!*		Endfunc
*========================================================================*
* Function Interpret
*========================================================================*
	Function Interpret(tcSource As String, tlDebug)
		Local loTokenizer As Object, loParser As Object
		loTokenizer = Createobject("BlackFoxTokenizer")
		loTokens = loTokenizer.Tokenize(tcSource)
		loParser = Createobject("BlackFoxParser", loTokens)
		If tlDebug
			For Each loToken In loTokens
				?"Type: ", Alltrim(Str(loToken.Type)), " = ", loToken.toString(), " Value: ", loToken.Value
			Endfor
		Endif
		loParser.ParseCommand()
		loTokenizer = .Null.
	Endfunc
Enddefine