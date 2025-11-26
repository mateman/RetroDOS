[BITS 16]
[ORG 0x7C00]

start:
    ; Configure segmentos
    xor ax, ax             ; Limpiar AX
    mov ds, ax             ; Configura segmentos de datos
    mov es, ax             ; Configura segmentos extra
    mov ss, ax             ; Configura segmento de pila    
    mov sp, 0x7C00         ; Configura el puntero de pila

    ; Mostrar mensaje inicial
    mov si, boot_msg       ; Carga dirección de mensaje del Boot
    call print_string      ; Llama a la funcion para imprimir

    ; Leer el kernel (asumiendo que está en el segundo sector)
    mov ah, 0x02        ; Función de lectura de sectores (BIOS)
    mov al, 4           ; Número de sectores a leer (ajustar según tamaño del kernel)
    mov ch, 0           ; Cilindro 0
    mov cl, 2           ; Sector 2
    mov dh, 0           ; Cabeza 0
;    mov dl, 0x80        ; Primer disco duro
    mov bx, 0x1000      ; Dirección donde está el kernel
    int 0x13            ; Llamada a la BIOS
    jc disk_error       ; Si falla, ir a manejo de errores

    ; Saltar al kernel
    jmp 0x1000   ; Dirección donde se cargo el kernel
disk_error:
    ; Mostrar mensaje de error
    mov si, error_msg    ; Carga dirección de mensaje de error
    call print_string    ; Imprime mensaje de error
    jmp halt

print_string:
        lodsb            ; Cargar un caracter en AL
        or al, al        ; ¿Fin de cadena?
        jz .done         ; Si Al == 0, terminar
        mov ah, 0x0E     ; Servicio de impresión de BIOS
        int 0x10         ; Llamada a BIOS
        jmp print_string ; Siguiente caracter
.done:
        ret
halt:
    hlt                ; Detener la CPU
    jmp halt           ; Bucle infinito
boot_msg db "Cargando kernel...", 0
error_msg db "Error al cargar kernel", 0

; Rellenar hasta 512 bytes
times 510-($-$$) db 0 ; Rellenar hasta 510 bytes
dw 0xAA55             ; Firma del bootloader 2 bytes    