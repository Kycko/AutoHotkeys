#Requires AutoHotkey v2.0.18+

;def TLD_paste_coords():
;    coords = ahkpy.get_clipboard().replace('::', ' ')
;    ahkpy.set_clipboard('tp ' + coords)
;    ahkpy.send('^v')
;def vscode_paste_tld(key):
;    buffer = ahkpy.get_clipboard().splitlines()
;    new_buffer = []
;    for line in buffer:
;        if line and line[0] != '[':
;            if key == 'F2':
;                temp = line.split()
;                temp[1] = ''
;                new_buffer.append(' '.join(temp))
;            else:
;                new_buffer.append(line)
;    new_buffer.append('')
;    ahkpy.set_clipboard('\n'.join(new_buffer))
;    ahkpy.send('^v')

KnobScroll(key) {
    Send  (key)
    Sleep (200)
}

       ^#q::return              ; отключить запуск быстрой помощи Windows
  CapsLock::Send('#{Space}')    ; переключить язык ввода
     SC130::Send( '{Volume_Up 2}')
     SC12E::Send( '{Volume_Down 2}')
   !Delete::Send( ' ')  ; неразрывный пробел
!Backspace::Send( ' ')  ; неразрывный пробел

#HotIf WinActive('ahk_exe Photos.exe')  ; клавиши только для приложения просмотра картинок
  ^Up::Send('^=')   ; приблизить
^Down::Send('^-')   ; отдалить

#HotIf WinActive('ahk_exe msedge.exe')
^S::return  ; отключаем сохранение
^D::return  ; отключаем добавление в избранное

#HotIf WinActive('ahk_exe msedge.exe') or WinActive('ahk_exe excel.exe')
^SC130::KnobScroll('^{PgDn}')
^SC12E::KnobScroll('^{PgUp}')

#HotIf WinActive('ahk_exe eurotrucks2.exe') or WinActive('ahk_exe amstruck.exe')
   F9::Send(  '{Media_Play_Pause}')
  F11::Send(  '{Media_Prev}')
  F12::Send(  '{Media_Next}')
SC130::Send('^!{Volume_Up}')
SC12E::Send('^!{Volume_Down}')

   ; TLD_APP = ahkpy.windows.active_window_context('TheLongDark', match='contains')          # клавиши только для The Long Dark
; TLD_APP.hotkey('^v', TLD_paste_coords)

; VSCode = ahkpy.windows.active_window_context('Visual Studio Code', match='contains')    # только для VS Code
; VSCode.hotkey('F1', vscode_paste_tld, 'F1')
; VSCode.hotkey('F2', vscode_paste_tld, 'F2')

#HotIf WinActive('ahk_exe onenote.exe') ; клавиши только для One Note
!Numpad5::Send ':'

#HotIf WinActive('ahk_exe code.exe')
^SC130::KnobScroll('^{PgDn}')
^SC12E::KnobScroll('^{PgUp}')

#HotIf WinActive('ahk_exe upnote.exe')
F2::Send('^+w')
