********
Ejemplos
********

Crear tabla::

	# CREATE TABLE Empleado
	(
	id serial NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50),
	Apellido VARCHAR(50),
	Direccion VARCHAR(255),
	Ciudad VARCHAR(60),
	Telefono VARCHAR(15),
	Peso VARCHAR (5),
	Edad integer,
	"Actividad" VARCHAR(100),
	idCargo integer
	);

Añadir columna::

	alter table empleado add column numero_sanitario varchar(9);

Modificar columna a no nulo::

	alter table empleado alter column numero_sanitario set not null;

Eliminar columna::

	alter table empleado drop column actividad;

Eliminar base de datos::

	drop database pruebas;

Eliminar tabla::

	drop table empleado;

Insertar empleado::

	insert into empleado ('id', 'nombre' ) values (1,'Pedro');

	insert into empleado ("nombre" ) values ("Pedro");

	insert into empleado ("nombre" ) values ('Pedro');
	insert into empleado ("nombre" ) values ('Martin');
	insert into empleado ("nombre" ) values ('Miguel');
	insert into empleado ("nombre" ) values ('Maria');
	insert into empleado ("nombre" ) values ('Luis');

Modificar empleado::

	update empleado set "nombre" = 'Luis' where nombre = 'Pedro';

	¿ update empleado set "nombre" = 'Luis'; ?

Eliminar empleado::

	delete from empleado where "nombre" = 'Luis';

	¿ delete from empleado; ?

Cargamos datos de ejemplo::

	psql -U alumno -d curso < datos_ejemplo.sql

Mostrar todos los departamentos::

	select * from curso.departamento;
	
	¿ select id from curso.departamento; ?
	¿ select d.id from curso.departamento; ?

Mostrar el departamento de los municipios::

	select distinct departamento from municipio;

	¿ select departamento from municipio; ?

Mostrar los municipios del departamento 1188 o 1201::

	select * from municipio where departamento = 1188 OR departamento = 1201;

Municipios que no sean el 1200::

	select * from municipio where departamento <> 1200;

Municipios con departamento entre 1196 y 1202::

	select * from municipio where departamento between 1188 and 1200;

	¿ select * from municipio where departamento between 1188 and 1200 order by departamento; ?

Trabajador que se llame Miguel::

	select * from trabajador where nombre like 'Miguel'

	¿ select * from trabajador where nombre like 'Miguel' and apellidos like '%Gar%' ?;

Media de la población de los municipios::

	select avg(m.poblacion) from municipio as m;

Municipio de mayor superficie y de menor perímetro::

	select max(m.superficie) from municipio as m;
	select min(m.perimetro) from municipio as m;
	
Suma total de la población de los municipios del departamento 1200::

	select sum(m.poblacion) from municipio as m where m.departamento = 1200;

Número de municipios agrupados por departamento::

	select departamento, count(*) from municipio group by departamento;

	¿ select departamento, municipio from municipio group by departamento; ?
	
	¿ select departamento, municipio from municipio group by departamento, municipio; ?

Seleccionar municipios con sus departamentos::

	select * from municipio join departamento on municipio.departamento = departamento.id;

	select * from municipio as m, departamento as d where m.departamento = d.id;

	¿ select count(*) from municipio as m, departamento as d where m.departamento = d.id; ?

	¿ select count(*) from municipio; ?

Seleccionar todos los municipios con sus departamentos::

	select * from municipio left join departamento on municipio.departamento = departamento.id;

	select count(*) from municipio left join departamento on municipio.departamento = departamento.id;

Seleccionar todos los municipios con departamento 1200 junto con los del departamento 1201

	select * from municipio where departamento = 1200 union select * from municipio where departamento = 1201

Crear una vista con los municipios del departamento de Choluteca

	create view municipos_choluteca as select m.id as id_mun, d.id as id_dep, m.municipio, m.poblacion, d.name from municipio as m, departamento as d where m.departamento = d.id and d.name = 'Choluteca';

Ejercicios::

* Mostrar los barrios que no tienen zonas asignadas
* Mostrar que equipo tiene más zonas asignadas
* ¿Cuantos barrios no tienen equipos designados?
* ¿Existe algún equipo sin responsable?
* ¿Qué población atiende la zona 3?
