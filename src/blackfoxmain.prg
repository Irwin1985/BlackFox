*========================================================================*
* BlackFox Main Program
*========================================================================*

Set Path To "Src" Additive
Set Path To "..\Bin" Additive

Set Procedure To 'blackfoxTokenizer' Additive
Set Procedure To 'blackfoxParser' Additive
Set Procedure To 'blackfoxInterpreter' Additive
Set Procedure To 'blackfoxToken' Additive
Set Procedure To 'BlackFoxHandler' Additive

If Type('_vfp.BlackFoxHandler') != 'U'
	=Removeproperty(_vfp, "BlackFoxHandler")
EndIf
=AddProperty(_vfp, "BlackFoxHandler", Createobject("BlackFoxHandler"))

* BlackFox Property
If Type('_vfp.BlackFox') != 'U'
	=Removeproperty(_vfp, "BlackFox")
Endif
=AddProperty(_vfp, "BlackFox", "")

=Bindevent(_vfp, "BlackFox", _vfp.BlackFoxHandler, "BlackFoxExecute", 1)

* JSONFox Start
If File("JSONFox.app")
	Do JSONFox.app
	_vfp.BlackFoxHandler.JSONFoxLoaded = Type('_Screen.json') = 'O'
EndIf
