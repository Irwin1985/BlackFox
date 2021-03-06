���   58  7  &                    d* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *
* TOKEN CONSTANTS
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *

#Define		TOKEN_UNKNOWN  		0
#Define		TOKEN_NUMBER		1
#Define		TOKEN_STRING  		2
#Define		TOKEN_KEYWORD  		3
#Define		TOKEN_WORD			4
#Define		TOKEN_COMMA  		5
#Define		TOKEN_COMMENT  		6
#Define		TOKEN_NULL			7
#Define		TOKEN_CREATE		8
#Define		TOKEN_JSON			9
#Define		TOKEN_OBJECT		10
#Define		TOKEN_FROM			11
#Define		TOKEN_FILE			12
#Define		TOKEN_CONNECTION	13
#Define		TOKEN_METHOD		14
#Define		TOKEN_GET			15
#Define		TOKEN_POST			16
#Define		TOKEN_HTTP			17
#Define		TOKEN_REQUEST		18
#Define		TOKEN_FOR			19
#Define		TOKEN_CURSOR		20
#Define		TOKEN_IN			21
#Define		TOKEN_SCREEN		22
#Define		TOKEN_TO			23
#Define		TOKEN_PRINT			24
#Define		TOKEN_URL			25
#Define		TOKEN_ADD			26
#Define		TOKEN_HEADER		27
#Define		TOKEN_VALUE			28
#Define		TOKEN_WITH			29
#Define		TOKEN_BODY			30

* TOKEN STATE
#Define		TOKEN_STATE_NUMBER 		TOKEN_NUMBER
#Define		TOKEN_STATE_DEFAULT		99
#Define		TOKEN_STATE_WORD 		TOKEN_WORD
#Define		TOKEN_STATE_STRING		TOKEN_STRING
#Define		TOKEN_STATE_COMMENT		TOKEN_COMMENT  %   �	  �
  �  n   �
  ґ>Q   �  U  "  G � G � GF� ��C�  � �� U  THIS POPULATECURSOR� ��  Q� STRING�9 �� Q�
 COLLECTION� Q� INTEGER� Q�	 CHARACTER� � T� �C�
 Collection�N�� T� ��c�� T� ���� T� ��  �� T� ��  �� �� ���(�C�  >���� T� �C�  � �\�� H�� ��� �� �c���� H�� ��� �C� ���� T� ���� T� �� �� �C � � �	 ��G� T� ���� T� �� �� �C� � "� '���x� T� �� �� T� ���� �� � #���� T� ���� 2��� � �� ���3� %�C� �
���' ��CC� blackfoxToken� � �N� �
 �� T� ��  �� T� ��c�� T� �� ��� �/� T� �� � �� � �� ����� %�C � � �	 
���� T� �C � � � ��( ��CC� blackfoxToken �  � �N� �
 �� T� ��  �� T� ��c�� T� �� ��� ��� T� �� � �� � �� ���l� %�� � ��O�' ��CC� blackfoxToken� � �N� �
 �� T� ��  �� T� ��c�� T� ��  �� �h� T� �� � �� � �� ����� %�C� C� C�
 ����� T� ��c�� � 2��� � ��	 B�� �� U  TCSOURCE LOTOKENLIST LNTOKENSTATE LCLOOK
 LCTOKENSTR LOTOKEN LCSTRINGDELIMITER I THIS ISLETTER ADD LNTYPE FINDCOMMANDTYPEJ  ��  �@ B�CC�  C� aC� z�� CC�  C� AC� Z�� C�  C� _�� U  TCLETTERs  ��  � � ���� T� ����� ��( o� qKeyword�� ���C� �C�  @��� �! B�CCC�� �� �� C�� 6�� U 	 TCCOMMAND AKEYNAME KEY_TYPE QKEYWORD KEY_NAME( h�� qKeyword� � I� � C����- r�� qKeyword� � ������ create��1 r�� qKeyword� � ������
 connection��- r�� qKeyword� � ������ method��+ r�� qKeyword� � ���	��� json��- r�� qKeyword� � ���
��� object��* r�� qKeyword� � ������ get��+ r�� qKeyword� � ������ post��+ r�� qKeyword� � ������ http��. r�� qKeyword� � ������ request��+ r�� qKeyword� � ������ from��* r�� qKeyword� � ������ for��+ r�� qKeyword� � ������ file��- r�� qKeyword� � ������ cursor��) r�� qKeyword� � ������ in��- r�� qKeyword� � ������ screen��) r�� qKeyword� � ������ to��, r�� qKeyword� � ������ print��* r�� qKeyword� � ������ url��* r�� qKeyword� � ������ add��- r�� qKeyword� � ������ header��, r�� qKeyword� � ������ value��+ r�� qKeyword� � ������ with��+ r�� qKeyword� � ������ body�� U  QKEYWORD KEY_TYPE KEY_NAME Init,       Tokenizeh       IsLetter�      FindCommandType      PopulateCursor�     5 
 ��    �
 ��    �
 ��    �
 ��    �
 ��    � U   BlackFoxTokenizer SessionS
    9 a a a � 5 ��� � � � �Q� � � � � Q� � q� � !� � A q� � � A aQ�� � � A q� � � � A �� A � A A � 5 q 5 q � 1�5 �����������������������2 � � @� � � �1                    �  �  	      �  5
     D   �
  �  V   G   O  ;  ]   M     �  g   f   �            %           �     Y  O�AQb   � G)(�� Src�� G)(�� ..\Bin�� G+(�� blackfoxTokenizer�� G+(�� blackfoxParser�� G+(�� blackfoxInterpreter�� G+(�� blackfoxToken�� G+(�� BlackFoxHandler��( %�C� _vfp.BlackFoxHandlerb� U��� � ��C�C� BlackFoxHandler�� �2 ��C�C� BlackFoxHandlerC� BlackFoxHandler�N
��! %�C� _vfp.BlackFoxb� U��]� ��C�C� BlackFox�� � ��C�C� BlackFox�  
��0 ��C�C� BlackFox�C�  � BlackFoxExecute��� %�C� JSONFox.app0���� � JSONFox.app�% T�C�  � �C� _Screen.jsonb� O�� � U  BLACKFOXHANDLER JSONFOX APP JSONFOXLOADED� !�������A !aA ��!QA 1                   %   �  �       �  �Y>Q�   �  U   ��  Q� STRING� � �� Q� OBJECT� Q� OBJECT�! T� �C� BlackFoxTokenizer�N�� T� �C �  � � ��" T� �C� BlackFoxParser � �N�� %�� ��� � �� � �� �G ��� Type: ��CC� � Z����  = ��C� � ���  Value: �� �	 � �� � ��C� �
 �� T� ���� U  TCSOURCE TLDEBUG LOTOKENIZER LOPARSER LOTOKENS TOKENIZE LOTOKEN TYPE TOSTRING VALUE PARSECOMMAND	 Interpret,       
 ��    � U   BlackFoxInterpreter Custom�    ? Q�Q!� � qA A � � 2 � =                    �  �        �   �       %   9  �  V  P   �  ̑>Q�   �  U  .  ��  � � T� � ��  �� T� � �� �� U  TNTYPE TVVALUE THIS TYPE VALUE� ��  � T� ��  �� T�  �C�  � � �� H�7 �x� ��  � ��\ � T� �� UNKNOWN�� ��  ���� � T� �� NUMBER�� ��  ���� � T� �� STRING�� ��  ���� � T� �� KEYWORD�� ��  ���� � T� ��
 IDENTIFIER�� ��  ���� T� �� COMMA�� ��  ���9� T� �� COMMENT�� ��  ���[� T� �� NULL�� ��  ���� T� �� CREATE�� ��  �	���� T� �� JSON�� ��  �
���� T� �� OBJECT�� ��  ����� T� �� FROM�� ��  ���	� T� �� FILE�� ��  ���1� T� ��
 CONNECTION�� ��  ���U� T� �� METHOD�� ��  ���v� T� �� GET�� ��  ����� T� �� POST�� ��  ����� T� �� HTTP�� ��  ����� T� �� REQUEST�� ��  ��� � T� �� FOR�� ��  ���$� T� �� CURSOR�� ��  ���D� T� �� IN�� ��  ���h� T� �� SCREEN�� ��  ����� T� �� TO�� ��  ����� T� �� PRINT�� ��  ����� T� �� URL�� ��  ����� T� �� ADD�� ��  ���� T� �� HEADER�� ��  ���4� T� �� VALUE�� ��  ���V� T� �� WITH�� ��  ���x� T� �� BODY�� � B�� <� � >�� U  TNTOKENTYPE LCTYPE THIS TYPE Init,       ToString�      /  T�  �� �� T� ����
 ��    �
 ��    � U  TYPE VALUE BlackFoxToken CustomY    8 � 5 q � a� A11Aq!A11q1A1� 1� !1!A 12 � � � � @1                       M          ?	     J   ;   I	       %   +  �    �   �  �>Q�   �  U  @  ��  �& T� � �C� BlackFoxToken� �  �N�� T� � ��  �� U  TOTOKENS THIS TOKENAUX TOKENS� +��  � � ����� H�% ���( ��  � � �� �  � � �		��n � %��  � ��j � ��C�  � �� �( ��  � � �� �  � � �		��� � %��  � ��� � ��C�  � �� � ��  � � ���z� H�� �v� ��  � � ���� ��C� GET�  � �� ��  � � ���0� ��C� POST�  � �� 2�v�> ��� expected GET | POST but found 'C�  � � �  � � '�� � 2���' ��� unknown command 'C�  � � '�� � � U	  THIS CURRENTTOKEN TYPE	 NEXTTOKEN LJSONLOADED	 PARSEJSON	 PRINTJSON HTTPREQUEST
 PRINTTOKEN� ��  Q� STRING�  �� Q� BOOLEAN� Q� STRING� T� ��  � POST�� T� ��  �� ��C�� � �� ��CC� � �� �6� � �� T� �� � � �� ��C�� � �� ��C�� � �� T� �C� �	 �� Public &lcHttpObj
" &lcHttpObj = This.CreateHTTP()
 loHttp = &lcHttpObj
 ��C �   � �
 � �� %�� ��W� ��C�� � �� T� �C� �	 �� � +�� � � ����� ��C�� � �� ��C�� � �� T� �C� �	 �� ��C�� � �� T� �C� �	 �� ��C �  � �
 � �� � ��C � �
 � �� U  TCMETHOD LLPOST LCBODY THIS MATCHANDEAT	 LCHTTPOBJ CURRENTTOKEN VALUE LCURL GETSTRINGORIDENTIFIER LOHTTP OPEN TYPE LCHEADER LCVALUE SETREQUESTHEADER SEND�  ��  Q� STRING� T�  ��  �� H�+ �� � �� � � ���g � T�  �C� � � ��� ��C�� � �� �� � � ���� � T�  �� � � �� ��C�� � �� 2�� �> ���( expected IDENTIFIER | STRING but found 'C� � � '�� �	 B��  �� U  LCRESULT THIS CURRENTTOKEN TYPE VALUE MATCHANDEAT
 PRINTTOKEN� ��C��  � �� ��C�	�  � �� ��C�
�  � �� T� ��  � � �� ��C��  � �� T� �CC� ��9� � �� H�x ���( ��  � � �� �  �	 � �	��� ��C��  � �� T�
 ��  � � �� Public &lcVarName
 &lcVarName = lcJSONStr
 ��C��  � ��( ��  � � �� �  �	 � �	��T� ��C��  � �� ��C��  � ��
 �� � 2���' ��� unknown command 'C�  � � '�� � U  THIS MATCHANDEAT	 LOJSONOBJ CURRENTTOKEN VALUE	 LCJSONSTR JSON	 STRINGIFY TYPE	 NEXTTOKEN	 LCVARNAME
 PRINTTOKEN ��  � ��C�� � �� ��C�	� � �� ��C�
� � �� T�  �� � � �� ��C�� � �� ��C�� � �� H�w �� �� � � ���� � T� �� � � �� ��C�� � �� ��C �   � � � �� �� � � ���� T� �� � � �� ��C�� � �� ��C �  C� �� � �� �� � � ����� ��C�� � �� T�	 �� � � �� %�C�	 0��v� ��C �  C�	 ��� � �� ���" ��� file not found '�	 � '�� � ��C�� � �� �� � � ����� ��C�� � �� T�
 �� � � �� %�C�
 ����� � ���� T� ������� T� �� ��
 F��
 �� ~�t�	 ^J� � T� �� ��� � �� �� T� �� ��� �� � Public &lcJSONobj
& &lcJSONobj = Createobject("Empty")
1 T� �� AddProperty(�  � , '�
 � [1]')�� &lcMacro
 T� �� �� �� � ��� T� �� ���6 T� ��
 DIMENSION �  � .�
 � [CC� Z�� ]�� &lcMacro
1 T� ��  � .�
 � [CC� Z��
 ] = loData�� &lcMacro
 �� ��� ��� Alias not found '�
 �� � ��C�� � �� 2��5 ��� Syntax error: unknown command 'C� � � '�� � U 	 LCJSONOBJ THIS MATCHANDEAT CURRENTTOKEN VALUE TYPE LCSTRING CREATEJSONOBJECT	 LCVARNAME LCFILE	 LCCURNAME AROWS NCOUNTER LODATA LCMACRO NINDEX
 PRINTTOKENQ  ��  � � Public &tcVarName
. &tcVarName = _Screen.json.Parse(tcJSONStr)
 U 	 TCVARNAME	 TCJSONSTR�  ��  � �� � %�� � �  � � � ��S �' T� �C� BlackFoxToken�� NULL�N�� �y � T� �C� � �  � � � �� �	 B�� �� U 
 TNPOSITION LOTOKEN THIS TOKENPOSITION TOKENS COUNT ITEM  ��  � %�� � � �  ��5 � T� � �� � ��� �x �; ���! Parsing Error: unexpected token 'C �  � � � '�� � U  TNTOKEN THIS CURRENTTOKEN TYPE TOKENPOSITION
 PRINTTOKEN  B�C� �  � �� U  THIS GETTOKEN  B�C��  � �� U  THIS GETTOKEN7  ��  � T�  �C�  � � � �� B�C �  � � � �� U  TNTOKEN THIS CURRENTTOKEN TYPE TOKENAUX TOSTRINGA  %��C�  � 
��3 �  ��� JSONFox library needed.�� � B�a�� U  BLACKFOXHANDLER JSONFOXLOADED�  ��  Q� BOOLEAN� Q� OBJECT� T�  �-�� ��f �( T� �C� Msxml2.ServerXMLHTTP.6.0�N�� T�  �a�� ��n � �� %��  
��� � ��� �' T� � �C� MSXML2.ServerXMLHTTP�N�� T�  �a�� ��� � �� � %��  
��� ���$ T� � �C� Microsoft.XMLHTTP�N�� T�  �a�� ��� �� � %�C�	 loXMLHTTPb� O��h�, ���# could not create the XMLHTTP object�� �{� T�  �a�� �	 B�� �� U  LCREATED	 LOXMLHTTP THIS OXMLHTTP Init,       ParseCommand�       HTTPRequest�      GetStringOrIdentifierK     	 PrintJSON�     	 ParseJSON�      CreateJSONObjectZ      GetToken�      MatchAndEat�      CurrentToken_AccessR      NextToken_Accessy     
 printToken�      lJSONLoaded_Access     
 CreateHTTPw     �  T�  ���� T� ���� T� ���� T� ���� T� ���� T� �-��
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 �� 	   �
 �� 
   �
 ��    �
 ��    �
 ��    �
 ��    � U  TOKENS CURRENTTOKEN	 NEXTTOKEN TOKENPOSITION TOKENAUX LJSONLOADED BlackFoxParser Custome    ? q a5 �� �� A �� A q� q1qA� �A � qA A = b� �2R!qQ� A �QA 5 � � qQq1� �A � 5 1�� �1Q��� � qA 6 q 1� q1Qr1ar1� q� !A r1� � � � � � � 1A Qa� � � a� � A � �A � QA 5 � Q�5 q q �q� �A � 5 q qq� �A 5 5 5 q �A5 1A q 5 � � �� � A � � q� � A A � � A� � A A ��� � A � 2 � � � � � � � � 0� @� � �� � � � � � � � � �1                      r        >  5        o  �  9   9   �  �  _   G   W  '  q   \   R  �  �   �   e  �  �   �   �  �  �   �   Y  /  �   �   	   "   �   �   �   !  �   �   �!  :"  �   �   #  u#    �   ]$  �&  
  �   �   �&       %     �  �     �  �>Q�   �  U  ) & T�  � �C� blackfoxInterpreter�N�� U  THIS OINTERPRETER! %�C� _vfp.BlackFoxb� C��
� ��v �# ��  Q�	 EXCEPTION� Q� BOOLEAN� T� �-�� ��C�C� C�X � � � � �� �(�  ��� ��C� Error Nro: CC�  � Z�C� � Line:CC�  � Z�C� �	 Message: �  � C� �	 Program: �  �	 �� BlackFox Error�x�� �� � U
  LOERR LDEBUG THIS OINTERPRETER	 INTERPRET BLACKFOX ERRORNO LINENO MESSAGE	 PROCEDURE  T�  � ���� U  THIS OINTERPRETER Init,       BlackFoxExecutem       Destroy�     7  T�  ���� T� �a��
 ��    �
 ��    �
 ��    � U  OINTERPRETER JSONFOXLOADED BlackFoxHandler Custom@    : a5 � 1� �� AA A 5 � 2 � � � � � 3                    �  �  
      �          J  f        �   p     ..\src\ blackfox.h blackfoxtokenizer.prg c:\users\irwin\appdata\local\temp\ blackfoxtokenizer.fxp blackfoxmain.prg blackfoxmain.fxp blackfoxinterpreter.prg blackfoxinterpreter.fxp blackfoxtoken.prg blackfoxtoken.fxp blackfoxparser.prg blackfoxparser.fxp blackfoxhandler.prg blackfoxhandler.fxp )   �                  �  �  )   L            �  �  )   s            �  �  )   �            �  _  )   �            _  �3  )   �            �3  7  )             