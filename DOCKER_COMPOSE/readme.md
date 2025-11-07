### Docker compose
> sudo docker-compose up<br>

Si los volúmenes de docker compose no están, se crearán y se guardarán en local<br>
Para tener una conexión con la base de datos de postgres usando pgadmin<br>
> sudo docker container list | grep 'postgres'
> sudo docker inspect <id_contenedor_postgres> | grep IPAddress

La dirección IP es la dirección del host para la conexión.<br>
El usuario, contraseña y nombre de la base de datos son las mismas que las que aparecen en el docker-compose en la imagen postgres
