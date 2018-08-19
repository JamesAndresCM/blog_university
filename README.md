## Blog University

### Demo
https://bloguniversity.herokuapp.com/

### Descripción 
- Sistema de blogging el cual permite publicaciones de un alumno para una asignatura de una carrera.

### Características
- Sistema de roles para usuarios
- Sistema de comentarios utilizando disqus
- Sistema de publicación utilizando ckeditor
- Un usuario normal solo puede publicar
- El usuario supervisor es quien aprueba las publicaciones

### Adicional
- Para utilizar los comentarios se debe crear el servicio en https://disqus.com/admin/create/ luego configurar el servicio de disqus (url) en el archivo `app/views/users/posts/show.html.erb`

### Usuarios por defecto
- admin@domain.com , contraseña : admin123
- supervisor@domain.com , contraseña : supervisor123
- user@domain.com, contraseña : user123

### Instalación
```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
### Imágenes

<img src="https://i.imgur.com/KX9InQI.png" />
<br>
<img src="https://i.imgur.com/oigERSx.png" />
<br>
<img src="https://i.imgur.com/v6GyKGE.png" />
<br>
<img src="https://i.imgur.com/EGJ4HCX.png" />
<br>
