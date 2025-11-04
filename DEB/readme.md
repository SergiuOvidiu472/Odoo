### Documentacion de odoo

https://www.odoo.com/documentation/18.0/es/administration/on_premise/packages.html#distribution-package

### Dependencias de odoo
- postgresql
- wkhtmltopdf
- python3-pip
   - xlwt
   - num2words

### Postresql
> sudo apt update -y<br>
> sudo apt upgrade -y<br>
> sudo apt install postgres -y<br>

### wkhtmltopdf
https://github.com/wkhtmltopdf/packaging/releases/tag/0.12.6.1-3<br>
Para ubuntu  **wkhtmltox_0.12.6.1-3.jammy_amd64.deb**<br>
> sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb<br>
> sudo apt install -f<br>
> sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb<br>

### python3-pip
> sudo apt install python3-pip -y<br>
> pip3 install xlwt --break-system-packages<br>
> pip3 install num2words --break-system-packages<br>

### odoo
https://packages.debian.org/sid/all/odoo-18/download<br>
Servidor de españa: ftp.es.debian.org/debian<br>
> sudo dpkg -i odoo-18_18.0.0+dfsg-2_all.deb<br>
> sudo apt install -f<br>
> sudo dpkg -i odoo-18_18.0.0+dfsg-2_all.deb<br>

### Verificación
Para comprobar el estado del servicio de odoo<br>
> sudo systemctl status odoo<br>

Los logs de odoo, por defecto, están en /var/log/odoo/odoo-server.log, aquí se puede comprobar toda la actividad del servicio<br>
Para verlo
> sudo cat /var/log/odoo/odoo-server.log

### Configuración
El archivo de configuración de odoo está en /etc/odoo/odoo.conf
