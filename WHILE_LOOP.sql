
SET SERVEROUTPUT ON;

DECLARE
	v_lp NUMBER := 0;
BEGIN
	WHILE v_lp<10
	LOOP
		v_lp := v_lp+1;
		DBMS_OUTPUT.PUT_LINE(v_lp);
	END LOOP;
END;
/
-- w loop operacja wykonywana minimum raz
DECLARE
	v_lp NUMBER := 0;
BEGIN
	LOOP
		v_lp := v_lp+1;
		DBMS_OUTPUT.PUT_LINE(v_lp);
		EXIT WHEN v_lp<10;
	END LOOP;
END;
/
-- kierunek i rozmiar iteracji
DECLARE
	v_lp NUMBER := 10;
BEGIN
	WHILE v_lp>0
	LOOP
		v_lp := v_lp-2;
		DBMS_OUTPUT.PUT_LINE(v_lp);
	END LOOP;
END;
/
-- u¿ycie zmiennych
DECLARE
	v_lp       NUMBER := 10;
	v_limit    NUMBER := 0;
	v_iteracja NUMBER := 2;
BEGIN
	WHILE v_lp>v_limit
	LOOP
		v_lp := v_lp-v_iteracja;
		DBMS_OUTPUT.PUT_LINE(v_lp);
	END LOOP;
END;
/
4_10.sql
Wyœwietlam 4_10.sql.