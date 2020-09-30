*========================================================================*
* Class BlackFoxHandler
*========================================================================*
Define Class BlackFoxHandler As Custom
	oInterpreter = .Null.
	JSONFoxLoaded = .T.
*========================================================================*
* Function Init
*========================================================================*
	Function Init
		this.oInterpreter = CreateObject("blackfoxInterpreter")
	EndFunc
*========================================================================*
* Function BlackFoxExecute
*========================================================================*
	Function BlackFoxExecute
		If Type('_vfp.BlackFox') = 'C'
			Try
				Local loErr As Exception, lDebug As Boolean
				lDebug = .F.
				this.oInterpreter.interpret(_vfp.BlackFox + Space(1), lDebug)
			Catch to loErr
				MessageBox("Error Nro: " + Alltrim(Str(loErr.ErrorNo)) + Chr(13) + "Line:" + Alltrim(Str(loErr.LineNo)) + Chr(13) + "Message: " + loErr.message + Chr(13) + "Program: " + loErr.Procedure, 16, "BlackFox Error")
			EndTry
		EndIf
	EndFunc
*========================================================================*
* Function Destroy
*========================================================================*
	Function Destroy
		this.oInterpreter = .Null.
	EndFunc
EndDefine