;#UseHook	;ホットキーラベルの定義で、常にフックを使用するようにする

;Changekeyでレジストリを書き換えた RWin->F13
;F13->F23
;F23->google 英語
F13::	;無変換
	KeyWait,F13,T0.3		;0.3秒対象キーが押されたかどうか
	If(ErrorLevel)
	{
		;ここに任意のコマンド 長押し
        send,{F23 Down}{F23 Up}
		KeyWait,F13
		Return
	}
	KeyWait,F13,D T0.2	;0.2秒対象キーが押されるのを待つ
	If(ErrorLevel)
	{
		;ここに任意のコマンド 1度押し
		send,{F23 Down}{F23 Up}
        KeyWait,F13
		Return
	}
	;ここに任意のコマンド 2度押し
    send,{F23 Down}{F23 Up}
	KeyWait,F13
	Return

;Changekeyでレジストリを書き換えた LWin->F14
;F14->F24
;F24->google 日本語
F14::	;無変換
	KeyWait,F14,T0.3		;0.3秒対象キーが押されたかどうか
	If(ErrorLevel)
	{
		;ここに任意のコマンド 長押し
        send,{F24 Down}{F24 Up}
		KeyWait,F14
		Return
	}
	KeyWait,F14,D T0.2	;0.2秒対象キーが押されるのを待つ
	If(ErrorLevel)
	{
		;ここに任意のコマンド 1度押し
		send,{F24 Down}{F24 Up}
        KeyWait,F14
		Return
	}
	;ここに任意のコマンド 2度押し
    send,{F24 Down}{F24 Up}
	KeyWait,F14
	Return

;ctrl + ] -> escape + google 英語
^[::
	send,{F23 Down}{F23 Up}{Esc Down}{Esc Up}
	Return

;space -> space
$space::send,{space} ; allow spaces still

;win -> ctrl
F13 & a::
Send ^a
return
F13 & b::
Send ^b
return
F13 & c::
Send ^c
return
F13 & d::
Send ^d
return
F13 & e::
Send ^e
return
F13 & f::
Send ^f
return
F13 & g::
Send ^g
return
F13 & h::
Send ^h
return
F13 & i::
Send ^i
return
F13 & j::
Send ^j
return
F13 & k::
Send ^k
return
F13 & l::
Send ^l
return
F13 & m::
Send ^m
return
F13 & n::
Send ^n
return
F13 & o::
Send ^o
return
F13 & p::
Send ^p
return
F13 & q::
Send !{f4} ;Quit Application
return
F13 & r::
Send ^r
return
F13 & s::
Send ^s
return
F13 & t::
Send ^t
return
F13 & u::
Send ^u
return
F13 & v::
Send ^v
return
F13 & w::
Send ^{f4} ;Close Window
return
F13 & x::
Send ^x
return
F13 & y::
Send ^y
return
F13 & z::
Send ^z
return

;application
space & c::RunActivateMinimize("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
space & v::RunActivateMinimize("C:\Users\kajir\AppData\Local\Programs\Microsoft VS Code\Code.exe")
space & t::RunActivateMinimize("ubuntu.exe")

RunActivateMinimize(exePass, exeOption="") {
  SplitPath, exePass, exeName
    Process, Exist, %exeName%
    Sleep, 200
    If (ErrorLevel != 0)
    IfWinNotActive, ahk_pid %ErrorLevel%
        WinActivate, ahk_pid %ErrorLevel%
    else
      WinMinimize, ahk_pid %ErrorLevel%
    else
      Run, %exePass% %exeOption%
}