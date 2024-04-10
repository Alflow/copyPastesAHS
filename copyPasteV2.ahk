#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

F9::
    currentRow := 41 ; Inicializa la fila inicial antes del bucle
    Loop, 670
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
            cif := oSheet.getCellByPosition(0, currentRow).getString()
            nombre := oSheet.getCellByPosition(1, currentRow).getString()
            apellido1 := oSheet.getCellByPosition(2, currentRow).getString()
            apellido2 := oSheet.getCellByPosition(3, currentRow).getString()
            email := oSheet.getCellByPosition(4, currentRow).getString()

            ; Cambia a Chrome
            IfWinExist, ahk_class Chrome_WidgetWin_1
            {

                WinActivate
                Sleep, 500

                ; Enviar los datos a Chrome
                Send, %nombre%
                Send, {Tab}
                Sleep, 500

                Send, %cif%
                Send, {Tab}
                Sleep, 500

                Send, %nombre%
                Sleep, 500
                Send,{SC039}
                Sleep, 500
                Send, %apellido1%
                Sleep, 500
                Send,{SC039}
                Sleep, 500
                Send, %apellido2%
                Sleep, 500
                Send, {Tab}
                Sleep, 500

                Loop, 2{
                    Send, {Tab}
                    Sleep, 500
                }

                Send, %email%
                Send, {Tab}
                Sleep, 500

                ; Interacciones adicionales en Chrome
                MouseClick, left, 1135, 182
                Sleep, 4000

                MouseClick, left, 27, 66
                Sleep, 4000

                MouseClick, left, 231, 296
                Sleep, 4000
                Send, ^a
                Send, {BackSpace}
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
      }  return
