============
Ejemplos SFA
============

Crear tabla de ejemplos::

	CREATE TABLE geometries (name varchar, geom geometry);

	INSERT INTO geometries VALUES
	  ('Point', 'POINT(0 0)'),
	  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
	  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
	  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
	  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');

	SELECT Populate_Geometry_Columns();

	SELECT name, ST_AsText(geom) FROM geometries;
	
Para la creación de esta tabla se ha realizado mediante CAST, ya que no se indica la operación::

	INSERT INTO geometries VALUES
	  ('Point', ST_GeomFromText('POINT(0 0)')),
	  ('Linestring', ST_GeomFromText('LINESTRING(0 0, 1 1, 2 1, 2 2)')),
	  ('Polygon', ST_GeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))')),
	  ('PolygonWithHole', ST_GeomFromText('POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))')),
	  ('Collection', ST_GeomFromText('GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))')),
	  ('MultyLinestring', ST_GeomFromText('MULTILINESTRING ((1 1, 5 5, 10 10, 20 20),(20 30, 10 15, 40 5))'));
	  
	  
Para comprobar la dimensión::

	select ST_Dimension(geom) from (select * from geometries where name = 'Point') as geom;
	
	select ST_NDims(geom) from (select * from geometries where name = 'Point') as geom;
	
	select ST_CoordDim(geom) from (select * from geometries where name = 'Point') as geom;
	
Podemos calcular el interior de una geometría::

	select st_astext(ST_Boundary(geom)) from (select * from geometries where name = 'PolygonWithHole') as geom;
	
	select st_astext(ST_Boundary(geom)) from (select * from geometries where name = 'Linestring') as geom;
	
Comprobamos la existencia de los métodos básicos de las geometrias::

	select st_astext(ST_Boundary(geom)) from (select * from geometries where name = 'PolygonWithHole') as geom;
	
	select st_srid(geom) from (select * from geometries where name = 'PolygonWithHole') as geom;
	
Definición de geometrías:

Point::

	select ST_NDims(geom) from (select * from geometries where name = 'Point') as geom;

	select st_astext(ST_Boundary(ST_GeomFromText('MULTIPOINT ((3 6), (4 6), (3 6))')))
	
	select st_astext(ST_Boundary(geom)) from (select * from geometries where name = 'Point') as geom;
	
	select st_issimple(ST_GeomFromText('MULTIPOINT ((3 6), (4 6), (3 6))'));
	
Linestring::

	select ST_Dimension(geom) from (select * from geometries where name = 'Linestring') as geom;
	
	select st_issimple(ST_GeomFromText('LINESTRING (3 8, 5 8, 5 9, 3 8, 2 7)'));
	
	select st_isclosed(ST_GeomFromText('LINESTRING (3 9, 6 9, 6 7, 3 9)'));
	
	select st_astext(ST_Boundary(ST_GeomFromText('LINESTRING (4 9, 4 6, 6 6)')))
	
	select st_isring(st_geomfromtext('LINESTRING (3 7, 2 4, 6 3, 6 7, 3 7)'));
	
MultiLinestring::

	select st_Dimension(ST_GeomFromText('MULTILINESTRING ((2 8, 2 8, 0.9 5, 3 3, 6 6.6), (5.5 8.6, 9.2 8.8, 8.6 4.7, 5 3), (1.3 1.9, 3.1 0.9, 2.8 3, 6.8 0.1))'));
	
	select st_isclosed(st_geomfromtext('MULTILINESTRING ((2 8, 2 6, 4 6, 2 8), (5 5.1, 6 7, 7 6))'));
	
	select st_astext(ST_Boundary(st_geomfromtext('MULTILINESTRING ((2 8, 2 6, 4 6, 2 8), (5 5.1, 6 7, 7 6))')));
	
MultiPolygon::

	select st_isvalid(ST_GeomFromText('MULTIPOLYGON (((2.1 9, 6 9, 6 5, 2.1 5, 2.1 9)),((7.1 6, 7.1 3, 4 3, 4 6, 7.1 6)))'));
	
	select st_isvalidreason(ST_GeomFromText('MULTIPOLYGON (((2.1 9, 6 9, 6 5, 2.1 5, 2.1 9)),((7.1 6, 7.1 3, 4 3, 4 6, 7.1 6)))'));
	
	select st_issimple(ST_GeomFromText('MULTIPOLYGON (((2.1 9, 6 9, 6 5, 2.1 5, 2.1 9)),((7.1 6, 7.1 3, 4 3, 4 6, 7.1 6)))'));
	
	
	
