SELECT first_name FROM employees;
/
--zliczanie przez nie jawny kursor liczny rekordow jakie zwraca
DECLARE 
TYPE t_empl IS TABLE OF employees%ROWTYPE;
var_empl t_empl;
counter NUMBER;
BEGIN 
SELECT * BULK COLLECT INTO var_empl FROM employees;
counter:= sql%ROWCOUNT;
DBMS_OUTPUT.PUT_LINE(counter);
end;
/
-- takie samo zliczanie jak wy¿ej z wykorzystaniem kursora jawnego
DECLARE 
CURSOR curr IS (SELECT * FROM employees);
v_empl employees%ROWTYPE;
counter NUMBER;
BEGIN 
FOR i IN curr
    LOOP
        
        counter:= curr%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE('counter ' || counter);
    END LOOP;
END;
