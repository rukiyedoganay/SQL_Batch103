CREATE  OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN x+y;
END
$$
SELECT * FROM toplamaF(4, 6);
















































