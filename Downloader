; Atajo de teclado para iniciar el bucle: Control + Alt + ñ
^!k::
    ; Solicitar número de pestañas a descargar
    InputBox, counter, Descargar pestañas, Introduce el número de pestañas a descargar:, , 300, 150

    ; Si el usuario cancela el InputBox o no introduce un número, se sale del script
    if ErrorLevel or counter <= 0
        return

    ; Comienza el loop hasta que counter llegue a 0
    Loop
    {
        ; Pulsar Control + S (Guardar)
        Send, ^s
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Pulsar flecha izquierda
        Send, {Left}
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Escribir el valor actual de counter
        Send, %counter%
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Escribir un punto
        Send, .
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Pulsar Enter para confirmar el guardado
        Send, {Enter}
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Pulsar Control + W para cerrar la pestaña
        Send, ^w
        Sleep, 700  ; Pausa de 0.7 segundos

        ; Restar 1 a la variable counter
        counter--

        ; Si counter es 0, salir del bucle
        if (counter <= 0)
            break
    }

    ; Mostrar un modal indicando que la descarga fue exitosa
    MsgBox, Las descargas se han completado con éxito.
return
