### Docker compose
> sudo docker-compose up<br>

Si los volúmenes de docker compose no están, se crearán y se guardarán en local<br>
Para mirar la dirección ip del contenedor de postgres<br>
> sudo docker container list | grep 'postgres'<br>
> sudo docker inspect <id_contenedor_postgres> | grep IPAddress<br>

Si se usa pgadmin, se crea un nuevo servidor, el nombre de la conexión puede ser cualquiera.<br>
En el apartado de conexión:
- La dirección IP del contenedor de postgres es la dirección del host para la conexión.<br>
- El usuario, contraseña y nombre de la base de datos son las mismas que las que aparecen en el docker-compose en la imagen postgres
