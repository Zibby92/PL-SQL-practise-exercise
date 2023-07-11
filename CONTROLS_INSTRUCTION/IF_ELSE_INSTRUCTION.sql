SET SERVEROUTPUT ON;


-- wyrazenie a warunek
DECLARE
    x BOOLEAN := 1=1;
BEGIN
    IF  x = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('TRUE');
    ELSIF x = FALSE THEN
        DBMS_OUTPUT.PUT_LINE('FALSE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NULL');
    END IF;
END;
/



-- przyklad(tylko jedna opcja dziala)
DECLARE
    x NUMBER := 7;
BEGIN
    IF  x>=5 THEN 
        DBMS_OUTPUT.PUT_LINE('wiêksze równe 5');
    ELSIF x>6 THEN
        DBMS_OUTPUT.PUT_LINE('wiêksze od 6');
    ELSE
        DBMS_OUTPUT.PUT_LINE('mniejsze ni¿ 5');
    END IF;
END;
/
-- liczenie pe³noletnosci
DECLARE
    v_data_urodzenia 		DATE := TO_DATE('2004-01-08' ,'YYYY-MM-DD');
    v_wymagana_ilosc_dni 	NUMBER := 18*365;
    v_ilosc_dni_klienta 	NUMBER;
BEGIN
    -- liczenie liczby dni od urodzenia
    v_ilosc_dni_klienta := SYSDATE - v_data_urodzenia;
    
    IF v_ilosc_dni_klienta >= v_wymagana_ilosc_dni THEN
        DBMS_OUTPUT.PUT_LINE('Gratulujê, wchodzisz na stronê.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Przykro mi, musisz ukoñczyæ 18 lat by odwiedziæ stronê.');
    END IF;
END;
/
-- or/and/not
DECLARE
    x NUMBER := 10;
BEGIN
    IF x>5 AND x < 8 THEN 
        DBMS_OUTPUT.PUT_LINE('opcja 1');
    ELSIF x>6 OR x < 9  THEN
        DBMS_OUTPUT.PUT_LINE('opcja 2');
    ELSE
        DBMS_OUTPUT.PUT_LINE('niesklasyfikowano');
    END IF;
END;
/
