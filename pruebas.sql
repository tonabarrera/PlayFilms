select u.email, t.tipo, count(*) as msj
from usuario u, tipousuario t 
where u.email='adimin@gmail.com' and u.password='12s3' and u.idTipoUsuario=t.idTipoUsuario;
select * from tipousuario;
insert into usuario values('adimin@gmail.com', '123', 'Administrador', 'Administrador', 1, 1);
call spLogin('adimin@gmail.com', '123');
insert into tipo values(2, 'Serie');
insert into categoria values(1, 'Anime');
insert into contenido values(1, 'The end of evangelion', 'url', 1, 1, 9);
select c.idContenido as id, c.nombre, c.descripcion, c.idCategoria as categoria, c.idTipo as tipo, c.calificacion from contenido c;
call spCatalogo();