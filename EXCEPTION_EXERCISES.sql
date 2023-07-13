set serveroutput on;
--zadanie 1
DECLARE
variable number := 11; 
BEGIN 
  CASE 
    WHEN variable = 10 THEN DBMS_OUTPUT.PUT_LINE('twoja zmienna wynosi 10');
  END CASE;
EXCEPTION 
    WHEN CASE_NOT_FOUND THEN DBMS_OUTPUT.PUT_LINE('kod bledu ' || sqlcode ||
    ' i jego tresc ' || sqlerrm);
    DBMS_OUTPUT.PUT_LINE('zmienna powinna wynosic 10 albo program powinien byc
    napisany inaczej');
END;
/
--zadanie 2
DECLARE
constraint_error EXCEPTION;
PRAGMA EXCEPTION_INIT(constraint_error,-00001); 
v_country_id varchar2(2):= 'ML';
v_country_name varchar2(10) := 'Malta';
BEGIN
INSERT INTO countries (country_id, country_name)
VALUES (v_country_id, v_country_name);
EXCEPTION 
    WHEN constraint_error THEN DBMS_OUTPUT.PUT_LINE('naruszyles constraint, 
    zmien wprowadzan¹ wartoœæ');
END;
/
--zadanie 3