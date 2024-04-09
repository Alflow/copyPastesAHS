F9::
    {
        
        Loop, 2{

        
        IfWinExist, ahk_class SALFRAME
        {
            WinActivate
            Sleep, 500

            ; Limpiar el portapapeles antes de copiar
            Clipboard := ""  
            Sleep, 500

            ; Copia cada dato necesario de LibreOffice Calc
            Send, ^c
            Sleep, 500
            nombre := MouseClick, left, 147, 558

            Send, {Right}
            Sleep, 500
            Send, ^c
            Sleep, 500
            apellido := Clipboard

            Send, {Right}
            Sleep, 500
            Send, ^c
            Sleep, 500
            dni := Clipboard

            Send, {Right}
            Sleep, 500
            Send, ^c
            Sleep, 500
            email := Clipboard

            ; Cambia a Chrome
            IfWinExist, ahk_class Chrome_WidgetWin_1
            {
                WinActivate
                Sleep, 500

                Send, %nombre%
                Send, {Tab}
                Sleep, 500

                Send, %apellido%
                Send, {Tab}
                Sleep, 500

                Send, %dni%
                Send, {Tab}
                Sleep, 500

                Send, %email%
                Send, {Tab}
                Sleep, 500

                MouseClick, left, 147, 558
                Send, {F5}
                Sleep, 4000

                ; Vuelve a LibreOffice
                IfWinExist, ahk_class SALFRAME
                {
                    WinActivate
                    Sleep, 500
                    Send, {Home}
                    Sleep, 500
                    Send, {Down}  ; Moverse a la siguiente fila
                    Sleep, 500
                }
            }
        }
        }
    }
return


; BACKUP
; F9::
;     {
        
;         Loop, 2{

        
;         IfWinExist, ahk_class SALFRAME
;         {
;             WinActivate
;             Sleep, 500

;             ; Limpiar el portapapeles antes de copiar
;             Clipboard := ""  
;             Sleep, 500

;             ; Copia cada dato necesario de LibreOffice Calc
;             Send, ^c
;             Sleep, 500
;             nombre := Clipboard

;             Send, {Right}
;             Sleep, 500
;             Send, ^c
;             Sleep, 500
;             apellido := Clipboard

;             Send, {Right}
;             Sleep, 500
;             Send, ^c
;             Sleep, 500
;             dni := Clipboard

;             Send, {Right}
;             Sleep, 500
;             Send, ^c
;             Sleep, 500
;             email := Clipboard

;             ; Cambia a Chrome
;             IfWinExist, ahk_class Chrome_WidgetWin_1
;             {
;                 WinActivate
;                 Sleep, 500

;                 Send, %nombre%
;                 Send, {Tab}
;                 Sleep, 500

;                 Send, %apellido%
;                 Send, {Tab}
;                 Sleep, 500

;                 Send, %dni%
;                 Send, {Tab}
;                 Sleep, 500

;                 Send, %email%
;                 Send, {Tab}
;                 Sleep, 500

;                 MouseClick, left, 147, 558
;                 Send, {F5}
;                 Sleep, 4000

;                 ; Vuelve a LibreOffice
;                 IfWinExist, ahk_class SALFRAME
;                 {
;                     WinActivate
;                     Sleep, 500
;                     Send, {Home}
;                     Sleep, 500
;                     Send, {Down}  ; Moverse a la siguiente fila
;                     Sleep, 500
;                 }
;             }
;         }
;         }
;     }
; return