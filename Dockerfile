# Usamos una imagen base de Nginx (puede ser la oficial o de Red Hat UBI si lo prefieres)
FROM nginx:1.27.4-alpine

# Cambiamos a root temporalmente para ajustar permisos
USER root

# Ajustamos permisos para que el usuario aleatorio (que asigna OpenShift)
# tenga permisos de lectura/escritura en /usr/share/nginx/html
RUN chmod -R g+rwX /usr/share/nginx/html && \
    chgrp -R 0 /usr/share/nginx/html

# Regresamos a usuario 'default' (no root) que OpenShift asigna en tiempo de ejecución
USER 1001

# Comando de arranque de Nginx
CMD ["nginx", "-g", "daemon off;"]
