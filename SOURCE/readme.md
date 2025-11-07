### Documentación de odoo
https://www.odoo.com/documentation/18.0/es_419/administration/on_premise/source.html
### Paquetes necesarios
- git
- python3
- python3-pip
- postgresql
- postgresql-client
- wkhtmltopdf

### Git
Si git no está instalado, escribe
> sudo apt update -y<br>
> sudo apt upgrade -y<br>
> sudo apt install git -y

Para verificar que git se instaló
> git --version

### Python
Para instalar python y pip
> sudo apt install python3 python3-pip -y

Para verificar python y pip
> python3 --version<br>
> pip3 --version

### Postgresql
Para instalar postgresql
> sudo apt install postgresql postgresql-client -y<br>

Para arrancar el servicio de postres
> sudo systemctl enable postgresql<br>
> sudo systemctl start postgresql

### Wkhtmltopdf
wkhtmltopdf debe de descargarse manualmente a través de un paquete debian<br>
En el repositorio de whtmltopdf están las descargas del paquete<br>
Enlace: https://github.com/wkhtmltopdf/packaging/releases/tag/0.12.6.1-3<br>
Para ubuntu: **wkhtmltox_0.12.6.1-3.jammy_amd64.deb**<br>

Después de descargar el paquete
> sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb

Es posible que aparezcan errores, por falta de dependencias en el sistema<br>
Para instalarlas
> sudo apt install -f

Después volver a instalarlo
> sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb

### Setup
Antes de descargar el repositorio de odoo, se tiene que crear un nuevo usuario de postgres, aunque postgres ya crea un usuario por defecto, odoo lo rechazará

Para crear un nuevo usuario postgres
> sudo -u postgres createuser -d -R -S $USER<br>
> createdb $USER

### Contraseña de la base de datos
Para poner una contraseña en la base de datos
> psql<br>
> \password<br>
> *escribes tu contraseña*<br>
> \q<br>

### Descarga del repositorio de odoo
Repositorio de github de odoo: 
https://github.com/odoo/odoo.git<br>
Version 18: https://github.com/odoo/odoo/tree/18.0<br>
Se puede descargar en zip o con git clone, la ventaja de git clone es que permite actualizar odoo usando git pull.<br>
Dentro del repositorio de odoo:<br>
> sudo ./setup/debinstall.sh

### Iniciar odoo
En el repositorio de odoo, hay un archivo llamado odoo-bin, que es el que arranca odoo<br>
Se puede pasar un archivo de configuración cualquiera con la opción '-c', y '-d' para conectarse con una base de datos<br>
La opción -i base se utiliza para iniciarlizar la base de datos
> ./odoo-bin -c odoo.conf -i base -d sergio
