;ctrl + ] -> escape + google 英語
^[::
  send,{esc}
  IME_SET(0)
  Return





;https://qiita.com/mareku/items/562c95e2afe707989b86
;application hotkey
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
      WinActivate, ahk_pid %ErrorLevel%
}

;上記のみだと、spaceキーが使えなくなる
;space -> space
$space::send,{space} ; allow spaces still





;https://kiz.hatenablog.jp/entry/2018/07/22/175504
;ChgKey.exeを使って、windows key <-> alt key 入れ替える
;https://github.com/karakaram/alt-ime-ahk
; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
;*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return


