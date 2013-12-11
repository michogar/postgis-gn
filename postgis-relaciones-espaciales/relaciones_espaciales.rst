
*********************
Relaciones espaciales
*********************

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

Introducción
============

Estos métodos lo que hacen es verificar el cumplimiento de determinados predicados geográficos entre dos geometrías distintas. Los predicados geográficos toman dos geometrías como argumento, y devuelven un valor booleano que indica si ambas geometrías cumplen o no una determinada relación espacial. Las principales relaciones espaciales contempladas son equals, disjoint, intersects, touches, crosses, within, contains, overlaps. 

Matriz DE-9IM
=============

Estas relaciones o predicados son descritas por la matriz DE-9IM (Dimensionally Extended 9 intersection Matrix), que es una construcción matemática de la rama de la topología.

	.. image:: _images/matriz.png
		:scale: 50 %

Figura: Mátriz DE-9IM de dos figuras geométricas dadas. Fuente: wikipedia en inglés [7] (http://en.wikipedia.org/wiki/DE-9IM)

En esta matriz se muestra las diferentes combinaciones entre las geometrías, su interior, exterior y contorno. Los valores posibles son:

* 0, 1, 2 como los valores de la dimensión
* F como el conjunto vacío.

Los patrones vienen definidos por el uso de los siguientes valores:

* T para cualquier valor.
* F para el conjunto vacío.

Por ejemplo en el caso de una intersección, el patrón que se debe cumplir debe ser::

	 T********, *T*******, **T****** o ***T*****

lo que indica que o el interior de A con el interior de B, o el interior de A con el contorno de B o el interior de A con el exterior de B o el contorno de A con el interior de B deben tener alguna dimensión.
Si comprobamos esto en varios casos::

	# select st_relate('POLYGON ((100 400, 300 400, 300 200, 100 200, 100 400))', 'LINESTRING (200 450, 130 300, 250 300, 150 150, 200 150)');

	# select st_relate('POINT (200 200)', 'LINESTRING (100 400, 200 300, 200 200, 300 100)');

En el primer caso cumple todos los patrones menos el segundo, y en el segundo caso cumple con el primero. Podemos ver que en ambos casos se cumplen varios patrones, por lo que además de intersecarse, se cruzan y se tocan.

Para el siguiente caso::

	# select st_relate('LINESTRING (200 400, 200 300, 200 200, 200 100)', 'LINESTRING (100 400, 200 300, 200 200, 300 100, 300 200)')

el resultado será: "1F1FF0102", indicándonos en este caso, que las geometrías se intersecan, pero no se cruzan, ya que la dimensión de sus interiores es igual a 1, mientras que el patrón nos dice que para cruzarse en el caso de dimensiones de las geometrías iguales, la dimensión de sus interiores debe ser 0.

	

Predicados espaciales
=====================

	.. image:: _images/mas_predicados_espaciales.png
		:scale: 50 %
		
Figura: Ejemplos de predicados espaciales. Fuente: wikipedia. http://en.wikipedia.org/wiki/File:TopologicSpatialRelarions2.png

	.. image:: _images/touches.png
		:scale: 50 %

Figura: Ejemplos de la relación “Touch” (toca). Fuente: “OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture”

	.. image:: _images/crosses.png
		:scale: 50 %

Figura: Ejemplos de la relación “Crosses” (cruza). Fuente: “OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture”

	.. image:: _images/within.png	
		:scale: 50 %
	
Figura: Ejemplos de la relación “Within” (contenido en). Fuente: “OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture”

	.. image:: _images/overlaps.png
		:scale: 50 %

Figura: Ejemplos de la relación “Overlaps” (solapa). Fuente: “OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture”

Los principales métodos de la clase Geometry para chequear predicados espaciales entra la geometría en cuestión y otra proporcionada como parámetro son:

	* **Equals (A, B)**: Las geometrías son iguales desde un punto de vista topológico
	* **Disjoint (A, B)**: No tienen ningún punto en común, las geometrías son disjuntas
	* **Intersects (A, B)**:Tienen por lo menos un punto en común. Es el inverso de Disjoint
	* **Touches (A, B)**: Las geometrías tendrán por lo menos un punto en común del contorno, pero no puntos interiores
	* **Crosses (A, B)**: Comparten parte, pero no todos los puntos interiores, y la dimensión de la intersección es menor que la dimensión de al menos una de las geometrías
	* **Contains (A, B)**: Ningún punto de B está en el exterior de A. Al menos un punto del interior de B está en el interior de A
	* **Within (A, B)**: Es el inverso de Contains. Within(B, A) = Contains (A, B)
	* **Overlaps (A, B)**: Las geometrías comparten parte pero no todos los puntos y la intersección tiene la misma dimensión que las geometrías.
	* **Covers (A, B)**: Ningún punto de B está en el exterior de A. B está contenido en A.
	* **CoveredBy (A, B)**: Es el inverso de Covers. CoveredBy(A, B) = Covers(B, A)

ST_Equals
---------
::

	ST_Equals(geometry A, geometry B), comprueba que dos geometrías sean espacialmente iguales.

ST_Equals devuelve TRUE si dos geometrías del mismo tipo tienen identicas coordenadas x,y. 

Ejemplo
"""""""
Sobre la capa paises vecinos::

	# select st_equals(tabla.geom, pv.geom) as iguales, pv.definicion from gis.paises_vecinos as pv, (select geom from gis.paises_vecinos where definicion = 'Guatemala') as tabla


ST_Intersects, ST_Disjoint, ST_Crosses y ST_Overlaps
----------------------------------------------------
Comprueban la relación entre los interiores de las geometrías.

ST_Intersects
^^^^^^^^^^^^^
::

	ST_Intersects(geometry A, geometry B) 
	
Devuelve TRUE si la intersección no es un resultado vacío.

Ejemplo
"""""""
::

	# select count(*) as tramos_rio from (select * from gis.honduras_departamentos as de) as departamentos, (select * from gis.rios) as rios where st_intersects(departamentos.geom, rios.geom) and departamentos.name_1 = 'Choluteca'


ST_Disjoint
^^^^^^^^^^^
::

	ST_Disjoint(geometry A , geometry B)
	
Es el inverso de ST_Intersects. indica que dos geometrías no tienen ningún punto en común. Es menos eficiente que ST_Intersects ya que esta no está indexada. Se recomienda comprobar ``NOT ST_Intersects``

Ejemplo
"""""""
::

	Comprobar los departamentos que no tocan Choluteca

	# create table gis.disjuntos as select de.gid, de.name_1, de.geom from gis.honduras_departamentos as de, (select * from gis.honduras_departamentos where name_1 = 'Choluteca') as departamento where st_disjoint(de.geom, departamento.geom)

Realizar la misma operación utilizando NOT ST_Intersects

ST_Crosses
^^^^^^^^^^
::

	ST_Crosses(geometry A, geometry B)
	
Se cumple esta relación si el resultado de la intesección de dos geometrías es de dimensión menor que la mayor de las dimensiones de las dos geometrías y además esta intersección está en el interior de ambas.

Ejemplo
"""""""
::

	# select count(*) as tramos_rio from (select * from gis.honduras_departamentos as de) as departamentos, (select * from gis.rios) as rios where st_crosses(departamentos.geom, rios.geom) and departamentos.name_1 = 'Choluteca'

ST_Overlap
^^^^^^^^^^
::

	ST_Overlaps(geometry A, geometry B) 
	
compara dos geometrías de la misma dimensión y devuelve TRUE si su intersección resulta una geometría diferente de ambas pero de la misma dimensión

ST_Touches
^^^^^^^^^^
::

	ST_Touches(geometry A, geometry B)
	
Devuelte TRUE si cualquiera de los contornos de las geometrías se cruzan o si sólo uno de los interiores de la geometría se cruza el contorno del otro.

Ejemplo
"""""""
::

	# create table gis.juntos as select de.gid, de.name_1, de.geom from gis.honduras_departamentos as de, (select * from gis.honduras_departamentos where name_1 = 'Choluteca') as departamento where st_touches(de.geom, departamento.geom)
	
ST_Within y ST_Contains
^^^^^^^^^^^^^^^^^^^^^^^
::

	ST_Within(geometry A , geometry B)
	
es TRUE si la geometría A está completamente dentro de la geometría B. Es el inverso de ST_Contains

::

	ST_Contains(geometry A, geometry B)
	
Devuelve TRUE si la geometría B está contenida completamente en la geometría A

Ejemplo
"""""""
::

	¿Cuantas escuelas hay en el Departamento de Valle?

	# select count(*) from (select * from gis.honduras_departamentos where name_1 = 'Valle') as departamento, (select * from gis.edificaciones where descripc like '%scuela%') as escuelas where ST_Contains(departamento.geom, escuelas.geom)
	

ST_Distance and ST_DWithin
^^^^^^^^^^^^^^^^^^^^^^^^^^
::

	ST_Distance(geometry A, geometry B)
	
Calcula la menor distancia entre dos geometrías.

::

	ST_DWithin(geometry A, geometry B, distance)
	
Permite calcular si dos objetos se encuentran a una distancia dada uno del otro.

Ejemplo
^^^^^^^
::

	Calcular las edificaciones del municipio de Choluteca que se encuentran a menos de 1Km de la mina
	
Primero creamos una tabla solo con las edificaciones del municipio para acelerar los procesos de análisis::

	create table gis.ed_choluteca as select ed.* 
	from gis.honduras_municipios as mu, gis.edificaciones as ed 
	where ST_Contains(mu.geom, ed.geom) and mu.municipio = 'Choluteca';

	create index ed_choluteca_gist on gis.ed_choluteca using gist(geom);

	select count(*), descripc, tipo from gis.ed_choluteca group by descripc, tipo;
	
Creamos la tabla con las edificaciones que hay a menos de 1000m de la mina, edificación tipo=12.::

	create table gis.ed_near_mina as select ed.geom, ed.tipo, ed.descripc 
	from gis.ed_choluteca as ed, (select geom from gis.ed_choluteca where tipo = 12) as mina 
	where ST_DWithin(ed.geom, mina.geom, 1000);

El uso del tipo **geography** para medir distancias, no obstante, es el recomendado cuando se trata de medir la distancia entre dos puntos de la Tierra muy distantes entre sí. 

En estos casos, un sistema de refencia plano no es una buena elección. Estos sistemas suelen dar buenos resultados a la hora de mostrar mapas en planos, porque conservan las direcciones, pero las distancias y áreas pueden estar bastante distorsionadas con respecto a la realidad. Es necesario utilizar un sistema de referencia espacial que conserve las distancias, teniendo en cuenta la curvatura terrestre. El tipo **geography** de PostGIS es un buen ejemplo, puesto que realiza los cálculos sobre una esfera, y no sobre un esferoide. 

JOINS espaciales
================
Permite combinar información de diferentes tablas usando relaciones espaciales como clave dentro del JOIN. Es una de las caracteristicas más potentes de las bases de datos espaciales. 

Veamos un ejemplo: Los nombres de los municipios del departamento Yoro

::

	# select mu.municipio, mu.depart from gis.honduras_municipios as mu, gis.honduras_departamentos as de where st_contains(de.geom, mu.geom) and de.name_1 = 'Yoro' order by mu.municipio


Cualquier función que permita crear relaciones TRUE/FALSE entre dos tablas puede ser usada para manejar un JOIN espacial, pero comunmente las más usadas son:

	* ST_Intersects
	* ST_Contains
	* ST_DWithin
	
JOIN y GROUP BY
---------------

El uso de las relaciones espaciales junto con funciones de agregacion, como **group by**, permite operaciones muy poderosas con nuestros datos. Veamos un ejemplo sencillo: EL número de municipios de los departamentos de Honduras::

	# select de.name_1, count(*) from gis.honduras_departamentos as de, gis.honduras_municipios as mu where ST_Contains(de.geom, mu.geom) group by de.name_1


1. La clausula JOIN crea una tabla virtual que incluye los datos de los departamentos y de los municipios
2. Las filas resultantes son agrupadas por el nombre del barrio y rellenadas con la función de agregación count().
