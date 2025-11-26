Este pequeño proyecto de sistema operativo es transcripción del código que se ve en el video https://youtu.be/2qoLEgeuMIg?si=yHJ78N1itLeHl8dm
Publicado por Parcela Digital https://parceladigital.com/ en el proyecto https://parceladigital.com/videoblog/creando-de-cero-la-base-de-un-sistema-operativo-de-16-bits-llamado-retrodos

Sólo le agregue tres archivos al proyecto original. Uno llamado kernel2.asm que lo que hice en él es mejorar el código quitando la impresión letra por letra de bienvenida y el prompt, remplazandolo con imprimir una cadena guardada en memoria al final del code.
Los dos archivos restantes son los .sh, uno para crear el archivo img y el otro para ejecutar qemu con todos los parametros necesarios tal como se muestra en el video
