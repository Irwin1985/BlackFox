#Include BLACKFOX.H
Define Class BlackFoxToken As Custom
	Type = 0
	Value = .Null.
*========================================================================*
* Function Init
*========================================================================*
	Function Init(tnType, tvValue)
		This.Type = tnType
		This.Value = tvValue
	Endfunc
*========================================================================*
* Function ToString
*========================================================================*
	Function ToString(tnTokenType)
		lcType = ''
		tnTokenType = Evl(tnTokenType, This.type)
		Do Case
		Case tnTokenType = TOKEN_UNKNOWN
			lcType = 'UNKNOWN'
		Case tnTokenType = TOKEN_NUMBER
			lcType = 'NUMBER'
		Case tnTokenType = TOKEN_STRING
			lcType = 'STRING'
		Case tnTokenType = TOKEN_KEYWORD
			lcType = 'KEYWORD'
		Case tnTokenType = TOKEN_WORD
			lcType = 'IDENTIFIER'
		Case tnTokenType = TOKEN_COMMA
			lcType = 'COMMA'
		Case tnTokenType = TOKEN_COMMENT
			lcType = 'COMMENT'
		Case tnTokenType = TOKEN_NULL
			lcType = 'NULL'
		Case tnTokenType = TOKEN_CREATE
			lcType = 'CREATE'
		Case tnTokenType = TOKEN_JSON
			lcType = 'JSON'
		Case tnTokenType = TOKEN_OBJECT
			lcType = 'OBJECT'
		Case tnTokenType = TOKEN_FROM
			lcType = 'FROM'
		Case tnTokenType = TOKEN_FILE
			lcType = 'FILE'
		Case tnTokenType = TOKEN_CONNECTION
			lcType = 'CONNECTION'
		Case tnTokenType = TOKEN_METHOD
			lcType = 'METHOD'
		Case tnTokenType = TOKEN_GET
			lcType = 'GET'
		Case tnTokenType = TOKEN_POST
			lcType = 'POST'
		Case tnTokenType = TOKEN_HTTP
			lcType = 'HTTP'
		Case tnTokenType = TOKEN_REQUEST
			lcType = 'REQUEST'
		Case tnTokenType = TOKEN_FOR
			lcType = 'FOR'
		Case tnTokenType = TOKEN_CURSOR
			lcType = 'CURSOR'
		Case tnTokenType = TOKEN_IN
			lcType = 'IN'
		Case tnTokenType = TOKEN_SCREEN
			lcType = 'SCREEN'
		Case tnTokenType = TOKEN_TO
			lcType = 'TO'
		Case tnTokenType = TOKEN_PRINT
			lcType = 'PRINT'
		Case tnTokenType = TOKEN_URL
			lcType = 'URL'
		Case tnTokenType = TOKEN_ADD
			lcType = 'ADD'
		Case tnTokenType = TOKEN_HEADER
			lcType = 'HEADER'
		Case tnTokenType = TOKEN_VALUE
			lcType = 'VALUE'
		Case tnTokenType = TOKEN_WITH
			lcType = 'WITH'
		Case tnTokenType = TOKEN_BODY
			lcType = 'BODY'
		EndCase
		Return '<' + lcType + '>'
	Endfunc
Enddefine