--SQL'de Function(Fonksiyon) nasıl yazılır:

--  Bazı görevleri daha hızlı yapabilmek için function oluşturulur. (Ortalama alma vs.)
--  CRUD operation için function oluşturulabilir.
--  SQL'de her function , return type olarak bir data verir.
--  Return type olarak data vermeyen işlemlere "Prpcedure" denir.

CREATE OR REPLACE FUNCTION addf (x NUMERIC, y NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql
AS 
$$

BEGIN

RETURN x+y;

END


$$

SELECT * FROM addf (2,3) AS "Addition";

--Koninin hacmini hesaplayan bir function yazınız. (pi r kare h bölü 3)

CREATE OR REPLACE FUNCTION volume_of_cone (r NUMERIC, h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS 
$$
	BEGIN 

	RETURN 3.14*r*r*h*1/3;

	END
$$

SELECT * FROM volume_of_cone(3,6) AS "Volume";


















