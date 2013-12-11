.. |PG| replace:: *PostGIS*
.. |PR|	replace:: *PostGIS Raster*	

**********
Validación
**********

.. note::

	=================  ====================================================
	Fecha              Autores
	=================  ====================================================           
	1 Noviembre 2012   * Micho García (micho.garcia@geomati.co)
	15 Octubre  2013   * Jorge Arévalo(jorge.arevalo@geomati.co)
	1 Diciembre 2013   * Micho García (micho.garcia@geomati.co)	
	=================  ====================================================

	©2012 Micho García
	
	Excepto donde quede reflejado de otra manera, la presente documentación se halla bajo licencia : Creative Commons (Creative Commons - Attribution - Share Alike: http://creativecommons.org/licenses/by-sa/3.0/deed.es)

Validar geometrías
------------------

Una operación común cuando se trabaja con datos vectoriales es validar que dichos datos cumplen ciertas condiciones que los hacen óptimos para realizar análisis espacial sobre los mismos. O de otra forma, que cumplen ciertas condiciones topológicas.

Los puntos y las líneas son objetos muy sencillos. Intuitivamente, podemos afirmar que no hay manera de que sean *topológicamente inválidos*. Pero un polígono es un objeto más complejo, y debería cumplir ciertas condiciones. Y debe cumplirlas porque muchos algoritmos espaciales son capaces de ejecutarse rápidamente gracias a que asumen una consistencias de los datos de entrada. Si tuviéramos que forzar a que esos algoritmos revisaran las entradas, serían mucho más lentos.

Veamos un ejemplo de porqué esto es importante. Supongamos que tenemos este polígono sencillo::

	# POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0));

Gráficamente:

	.. image:: _images/poligono_invalido.png
		:scale: 50 %

Podemos ver el límite exterior de esta figura como un símbolo de *infinito* cuadrado. O sea, que tiene un *lazo* en el medio (una intersección consigo mismo). Si quisiéramos calcular el área de esta figura, podemos ver intuitivamente que tiene 2 unidades de área (si hablamos de metros, serían 2 metros cuadrados).

Veamos qué piensa PostGIS del área de esta figura::

	# SELECT ST_Area(ST_GeometryFromText('POLYGON((0 0, 0 1, 1 1, 2 1, 2 2, 1 2, 1 1, 1 0, 0 0))'));

El resultado será::

	# st_area
	 ---------
       	0

¿Qué es lo que ha sucedido aquí?

El algoritmo de cálculo de áreas de PostGIS (muy rápido) asume que los anillos no van a intersectar consigo mismos. Un anillo que cumpla las condiciones adecuadas para el análisis espacial, debe tener el área que encierra **siempre** en el mismo lado. Sin embargo, en la imagen mostrada, el anillo tiene, en una parte, el área encerrada en el lado izquierdo. Y en la otra, el área está encerrada en el lado derecho. Esto causa que las áreas calculadas para cada parte del polígono tengan valores opuestos (1 y -1) y se anulen entre si.

Este ejemplo es muy sencillo, porque podemos ver rápidamente que el polígono es inválido, al contener una intersección consigo mismo (algo que ESRI permite en un SHP, pero PostGIS no, porque implementa SFSQL: http://www.opengeospatial.org/standards/sfs). Pero, ¿qué sucede si tenemos millones de polígonos? Necesitamos una manera de detectar si son válidos o inválidos. Afortunadamente, PostGIS tiene una función para esto: **ST_IsValid**, que devuelve TRUE o FALSE::

	# SELECT ST_IsValid(ST_GeometryFromText('POLYGON((0 0, 0 1, 1 1, 2 1, 2 2, 1 2, 1 1, 1 0, 0 0))'))

Devuelve::

	# st_isvalid
	 ------------
 		 f

Incluso tenemos una función que nos dice la razón por la que una geometría es inválida::

	# SELECT ST_IsValidReason(ST_GeometryFromText('POLYGON((0 0, 0 1, 1 1, 2 1, 2 2, 1 2, 1 1, 1 0, 0 0))'));

Que devuelve::

	# st_isvalidreason
	------------------------
 	Self-intersection[1 1]
 	
Mediante el uso de la función ``st_isvaliddetail`` podremos obtener la información similar de las funciones anteriores de una sola llamada. Esta función dispone de la opción de no tener encuenta los anillos autointersectados que son permitidos en el modelo ESRI.
 	
Diferencias entre el modelo ESRI y el modelo propuesto por OGC
--------------------------------------------------------------

Estas son algunas de las diferencias entre el modelo ESRI y el OGC:

* En el modelo ESRI los anillos de los polígonos tienen un sentido concreto mientras que en el OGC no.
* ESRI no permite puntos repetidos, en OGC sí.
* PostGIS permite geometrías nulas, ESRI no.
* PostGIS permite geometrías vacías, mientras que ESRI no.
* ESRI permite polígonos lazo

Por lo que conviene realizar operaciones de validación de geometrías después de la exportación de datos de ESRI y antes de la importación de datos a ESRI:

Conviene realizar operaciones antes de intercambiar datos entre ambos modelos:

De PostGIS a ESRI:

* Eliminar geometrías nulas
* Eliminar vértices repetidos
* Eliminar geometrías vacías
* Corregir geometrías no válidas

De ESRI a PostGIS:

* Comprobar validez geometrías
* Corregir no validez

Por ejemplo, si tenemos la geometría::

	POLYGON ((20 30, 30 30, 30 20, 20 20, 20 30), (22 28, 28 28, 22 24.8, 28.1 22, 22 22, 22 28))
	
y ejecutamos::

	# select st_isvaliddetail(st_geomfromtext('POLYGON ((20 30, 30 30, 30 20, 20 20, 20 30), (22 28, 28 28, 22 24.8, 28.1 22, 22 22, 22 28))'))
	
obtendremos un valid_detail(valid, reason, location)::

	(f,"Ring Self-intersection",01010000000000000000003640CDCCCCCCCCCC3840)
	
si queremos acceder a cada una de los valores::

	valid((f,"Ring Self-intersection",01010000000000000000003640CDCCCCCCCCCC3840)) nos devolverá f
	
Activando el "ESRI Flag"::

	# select st_isvaliddetail(st_geomfromtext('POLYGON ((20 30, 30 30, 30 20, 20 20, 20 30), (22 28, 28 28, 22 24.8, 28.1 22, 22 22, 22 28))'), 1)
	
el resultado será::

	(t,,)
	
Esto es así porque mediante este flag, PostGIS marcará como válidos los polígonos con anillos que se encuentran autointersectados.

Práctica
^^^^^^^^
Comprobar el funcionamiento de ST_MakeValid
"""""""""""""""""""""""""""""""""""""""""""
Partiremos del polígono con forma de lazo mostrado anteriormente::

	POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0))
	
Como vimos se trataba de una geometría no válida por lo que procederemos a su correción mediante el uso de la función ``ST_MakeValid``::

	# SELECT ST_AsText(ST_MakeValid(ST_GeomFromText('POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0))')));
	
Que dará como resultado un MULTIPOLYGON::

	MULTIPOLYGON(((0 0,0 1,1 1,1 0,0 0)),((1 1,1 2,2 2,2 1,1 1)))
	
Si quisiera mantener esta geometría en  mi tabla debería::

	# SELECT (st_dump(ST_MakeValid(ST_GeomFromText('POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0))')))).geom
	
Nos devolverá las geometrías tipo polígono.

En algunos casos el uso de la función ``ST_Buffer`` con valor 0 resuelve el problema de validez, pero podemos ver en este caso que esto a veces no es posible::

	# SELECT ST_AsText(ST_buffer(ST_GeomFromText('POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0))'), 0));
	
	POLYGON((1 1,1 2,2 2,2 1,1 1))
	
Comprobar como el uso de ST_Collect genera geometrías no válidas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

La función ST_Collect genera geometrías MULTI a partir de geometrías sencillas. Lo hace sin tener en cuenta la validez de la geometría resultado. Hay que recordar que para que una geometría MULTI sea válida, todas las geomtrías que la compongan deben ser válidas. Si tenemos dos geometrías que en origen son válidas::

	POLYGON ((0 2, 1 2, 1 1, 0 1, 0 2))'& POLYGON ((0.5 1.5, 1.5 1.5, 1.5 0.5, 0.5 0.5, 0.5 1.5))

Utilizando la función ``ST_Collect`` podremos generar una geometría inválida::

	#SELECT ST_isvaliddetail(ST_Collect(ST_GeomFromText('POLYGON ((0 2, 1 2, 1 1, 0 1, 0 2))'), ST_GeomFromText('POLYGON ((0.5 1.5, 1.5 1.5, 1.5 0.5, 0.5 0.5, 0.5 1.5))')))
	
	(f,Self-intersection,0101000000000000000000F03F000000000000F83F)
	
¿Qué pasaría si utilizase la función ST_MakeValid en este caso?.

Generar una restricción para evitar la carga de geometrías no válidas
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Podemos evitar que se introduzcan datos no válidos en nuestras tablas simplemente mediante el uso de restricciones. Si creamos la siguiente tabla::

	# CREATE TABLE gis.geometries
	(
	  gid serial NOT NULL,
	  geom geometry(Polygon),
	  CONSTRAINT pk_geometries PRIMARY KEY (gid )
	)
	
Añadiremos una restricción que no permita la inclusión de geometrías no válidas::

	# ALTER TABLE gis.geometries
	ADD CONSTRAINT geometry_valid_check
	CHECK (ST_IsValid(geom));
	
Al tratar de insertar un polígono no válido la restricción no lo permitirá::

	# INSERT INTO gis.geometries (geom) VALUES (ST_GeomFromText('POLYGON((0 0, 0 1, 2 1, 2 2, 1 2, 1 0, 0 0))'));
	
	NOTICE:  Self-intersection at or near point 1 1
	ERROR:  new row for relation "geometries" violates check constraint "geometry_valid_check"

	********** Error **********

	ERROR: new row for relation "geometries" violates check constraint "geometry_valid_check"
	SQL state: 23514
	
.. warning::

	Estas restricciones pueden afectar a procesos de carga masivos mediante scripts.

	
Comprobar la validez de las geometrías del shapefile *world_borders*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

.. note::

	Puedes obtener los datos desde aquí[`1`_]

.. _`1`: http://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip

::

	# SELECT gid, name, ST_IsValidReason(geom) FROM tm_world_borders WHERE ST_IsValid(geom)=false; 

Obtenemos el resultado::

	#  gid |  name  |                  st_isvalidreason
	  -----+--------+-----------------------------------------------------
  	    24 | Canada | Ring Self-intersection[-53.756367 48.5032620000001]
	    33 | Chile  | Ring Self-intersection[-70.917236 -54.708618]
	   155 | Norway | Ring Self-intersection[5.33694400000002 61.592773]
	   175 | Russia | Ring Self-intersection[143.661926 49.31221]

Observamos que hay 4 polígonos con intersecciones consigo mismos. Esto es un ejemplo del aspecto que tienen estas auto-intersecciones:

	
	.. image:: _images/self_intersection.png
		:scale: 50 %

Para resolver estos errores topológicos, tenemos a nuestra disposición la función *ST_MakeValid*. Esta función es nueva en PostGIS 2.0. Hasta entonces, estos problemas se resolvían con técnicas como hacer un buffer de tamaño 0 alrededor de la geometría inválida, y dejar que la función *ST_Buffer* la arreglara. Esto es así porque *ST_Buffer* en realidad construye una nueva geometría réplica de la antigua y construyendo un buffer alrededor de ella. Si este buffer es de tamaño 0, el resultado es solo la réplica de la anterior geometría. Pero al ser construida siguiendo las reglas topológicas de OGC, solucionaba muchos problemas como éste.

La función *ST_MakeValid* es más apropiada para arreglar geometrías. Únicamente requiere **GEOS 3.3.0** o superior para funcionar (**GEOS 3.3.4**) si estamos usando PostGIS 2.1). Para saber qué versión de GEOS tenemos instalada basta con ejecutar::

	# SELECT postgis_full_version()

Si se tiene una versión de GEOS inferior a la 3.3.0, se pueden seguir los consejos de Paul Ramsey: http://blog.opengeo.org/2010/09/08/tips-for-the-postgis-power-user/

Para comprobar el funcionamiento de *ST_MakeValid* vamos a crear una tabla nueva donde almacenemos únicamente uno de los polígonos conflictivos, marcado como *erroneo*. A continuación, crearemos un nuevo registro en dicha tabla con el polígono corregido. 

Para hacerlo, ejecutemos esta query, que es algo compleja. Como sabemos que el problema es una auto-intersección que forma un anillo, vamos a *desmontar* la geometría en su lista de anillos y quedarnos solo con aquel que intersecta con el punto donde se detectó el error::

	# SELECT * INTO invalid_geometries
	FROM (
	SELECT 'broken'::varchar(10) as status,
	ST_GeometryN(geom, generate_series(1, ST_NRings(geom)))::geometry(Polygon,4326) as the_geom
	FROM tm_world_borders
	WHERE name = 'Chile') AS foo
	WHERE ST_Intersects(the_geom, ST_SetSRID(ST_Point(-70.917236,-54.708618), 4326));
	
Con eso hemos creado la tabla *invalid_geometries* y añadido el anillo que contiene el error. Ahora añadamos un nuevo registro con el resultado de llamar a *ST_MakeValid* sobre el polígono erróneo::

	# INSERT INTO invalid_geometries
	VALUES ('repaired', (SELECT ST_MakeValid(the_geom) FROM invalid_geometries));

La función ST_MakeValid, realmente solo ha añadido un anillo más a la geometría inválida, para hacerla válida. Lo podemos comprobar con::

	# SELECT status, ST_NRings(the_geom) FROM invalid_geometries;

Que devuelve::

	# status  | st_nrings
	----------+-----------
	broken   |         1
	repaired |         2

Ahora que ya hemos comprobado cómo funciona *ST_MakeValid*, podemos arreglar todas las geometrías inválidas::

	# UPDATE tm_world_borders
	SET the_geom = ST_MakeValid(the_geom)
	WHERE ST_IsValid(the_geom) = false;

Una manera de evitar tener tablas con geometrías inválidas es definir una *constraint* que lo impida::

	# CREATE TABLE 

	# ALTER TABLE tm_world_borders
	ADD CONSTRAINT geometry_valid_check
	CHECK (ST_IsValid(geom));

