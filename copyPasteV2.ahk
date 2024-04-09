F9::
    currentRow := 1  ; Inicializa la fila inicial antes del bucle
    Loop, 2
    {
        IfWinExist, ahk_class SALFRAME
        {
            WinActivate
            Sleep, 500

            ; Crear la instancia del servicio de LibreOffice
            oSM := ComObjCreate("com.sun.star.ServiceManager")
            ; Crear una instancia de Desktop
            oDesk := oSM.createInstance("com.sun.star.frame.Desktop")
            ; Acceder al documento actual
            oDoc := oDesk.getCurrentComponent()
            ; Acceder a la hoja activa
            oSheet := oDoc.getCurrentController().getActiveSheet()

            ; Leer los valores directamente de las celdas
            nombre := oSheet.getCellByPosition(0, currentRow).getString()
            apellido := oSheet.getCellByPosition(1, currentRow).getString()
            dni := oSheet.getCellByPosition(2, currentRow).getString()
            email := oSheet.getCellByPosition(3, currentRow).getString()

            ; Cambia a Chrome
            IfWinExist, ahk_class Chrome_WidgetWin_1
            {
                WinActivate
                Sleep, 500

                ; Enviar los datos a Chrome
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

                ; Interacciones adicionales en Chrome
                MouseClick, left, 147, 558
                Send, {F5}
                Sleep, 4000

                ; Vuelve a LibreOffice
                IfWinExist, ahk_class SALFRAME
                {
                    WinActivate
                    Sleep, 500
                    ; Incrementa la fila para la siguiente iteración
                    currentRow++
                    ; Send, {Home}
                    ; Sleep, 500
                    ; Send, {Down}  ; Moverse a la siguiente fila
                    ; Sleep, 500
                }
            }
        }
    }
return