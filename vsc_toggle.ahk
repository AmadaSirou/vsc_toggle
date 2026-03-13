#Requires AutoHotkey v2.0
#SingleInstance Force

; --- 初期設定：VSCodeを常に最前面にする ---
SetupVSCode() {
    if hwnd := WinExist("ahk_exe Code.exe") {
        WinSetAlwaysOnTop(1, hwnd)        ; [cite: 1] 常に最前面に固定
    }
}

; 起動時に実行
SetupVSCode()

; --- 「無変換」キー（vk1D）による切り替え処理 ---

; 無変換キーを押し下げた時：VSCを最小化して裏画面を操作可能にする
*vk1D::
{
    if hwnd := WinExist("ahk_exe Code.exe") {
        WinMinimize(hwnd)                 ; [cite: 2] 最小化して背面のYouTube等を操作
    }
}

; 無変換キーを離した時：VSCを復元して最前面に戻す
*vk1D up::
{
    if hwnd := WinExist("ahk_exe Code.exe") {
        WinRestore(hwnd)                  ;  ウィンドウを復元
        WinSetAlwaysOnTop(1, hwnd)        ;  最前面設定を再適用
        WinActivate(hwnd)                 ;  フォーカスを確実にVSCへ戻す
    }
}

; 単独キー割り当て
sc079::LWin           ; 変換キーをWindowsキーに割り当て
RShift::#+Right       ; 右Shiftを Win + Shift + → に割り当て
RAlt::^+r             ; 右Altを Ctrl + Shift + R に割り当て
