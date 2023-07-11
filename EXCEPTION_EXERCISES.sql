DECLARE
variable number := 11; 
BEGIN 
  CASE 
    WHEN variable = 10 THEN DBMS_OUTPUT.PUT_LINE('twoja zmienna wynosi 10');
  END CASE;

END