#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

~Esc::
	ime_status := % IME_CHECK("A")
	if (ime_status="0"){
		
	} else {
		Send {vk15sc138}
	}
return

IME_CHECK(WinTitle){ 
	WinGet,hWnd,ID,%WinTitle% 
	Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"") 
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam){ 
	DetectSave := A_DetectHiddenWindows 
	DetectHiddenWindows,ON 
	SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd% 
	if (DetectSave <> A_DetectHiddenWindows) 
		DetectHiddenWindows,%DetectSave% 
	return ErrorLevel 
} 

ImmGetDefaultIMEWnd(hWnd){ 
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint) 
}


