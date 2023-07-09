
SET SERVEROUTPUT ON;

BEGIN
	FOR i IN 1..10
	LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	   --  i:=5;
	END LOOP;
END;
/
-- kierunek iteracji
BEGIN
	FOR i IN REVERSE 1..10
	LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
END;
/
-- u¿ycie zmiennych
DECLARE
	v_start NUMBER := 1;
	v_end   NUMBER := 10;
BEGIN
	FOR i IN v_start..v_end
	LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
END;
/
4_11.sql
Wyœwietlam 4_11.sql.