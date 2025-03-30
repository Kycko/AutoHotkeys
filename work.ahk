#Requires AutoHotkey v2.0.18+

  lowerText()    {
    Send('^c{Delete}')
    Sleep(50)
    str := StrLower(A_Clipboard)
    Send(str)
}
     rmHTTP()    {
    Send ('^a^c')
    ClipWait
    pasteBuffer()
}
pasteBuffer()    {
    str := RegExReplace(A_Clipboard,'^htt(p|ps)://','',,1)
    str := RegExReplace(      str,  '^www.'          ,'',,1)
    str := RegExReplace(      str,  '/$'             ,'',,1)
    str := RegExReplace(      str,'.*(?=cian.ru)'    ,'',,1)
    str := RegExReplace(      str,'.*(?=hh.ru)'      ,'',,1)
    str := RegExReplace(      str,'.*(?=rabota.ru)'  ,'',,1)
    str := RegExReplace(      str,'.*(?=superjob.ru)','',,1)
    str := RegExReplace(      str,'.*(?=zarplata.ru)','',,1)
    Send(str)
}
 KnobScroll(key) {
    Send  (key)
    Sleep (200)
}
 save_toCSV()    {
    Send('{Tab}')
    Sleep(50)
    Send('c')
    Sleep(50)
    Send('{Enter}')
 }

       ^#q::return            ; отключить запуск быстрой помощи Windows
  CapsLock::Send('#{Space}')  ; переключить язык ввода
     SC130::Send( '{Volume_Up   2}')
     SC12E::Send( '{Volume_Down 2}')
!BackSpace::Send(' ') ; неразрывный пробел
   !Delete::Send(' ') ; неразрывный пробел

#HotIf WinActive('ahk_exe msedge.exe')
   ^D::                         ; отключаем добавление в избранное
   ^R::                         ; отключаем такой хоткей обновления
   ^S::return                   ; отключаем сохранение
SC130::Send('{WheelDown 5}')    ; прокрутка вниз
SC12E::Send('{WheelUp   5}')    ; прокрутка вверх

#HotIf  WinActive('ahk_exe excel.exe')
   F8:: lowerText() ; преобразовать выделенный текст в строчные буквы
Pause::save_toCSV() ; выбрть .csv и сохранить

;F7::FIO_toIP(true)  ; -> Фамилия И.О.
;F9::addCity(true)   ; добавить город

#HotIf WinActive('ahk_exe msedge.exe') or WinActive('ahk_exe excel.exe')
^SC130::KnobScroll('^{PgDn}')
^SC12E::KnobScroll('^{PgUp}')
    ;!v::rmHTTP()
    F1::return  ; отключаем справку
    F8::lowerText()
    ;F9::addCity()

#HotIf WinActive('ahk_exe code.exe')
^SC130::KnobScroll('^{PgDn}')
^SC12E::KnobScroll('^{PgUp}')
