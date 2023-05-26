# Establecer el directorio de trabajo
cd /opt/framework

# Ejecutar el comando deseado de Gradle
xvfb-run -a --server-args="-screen 0 1920x1080x24" gradle runWithCucumber -P tags=@${TAG} ; exit 0

# Configurar permisos y ejecutar el script de envío de reporte a Jira
chmod 777 /opt/framework/xray.sh
sh ./xray.sh
