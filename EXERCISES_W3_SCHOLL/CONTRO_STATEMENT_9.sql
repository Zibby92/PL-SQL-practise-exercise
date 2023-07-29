CREATE OR REPLACE PROCEDURE grades ( add_grade NUMBER) IS
description_1 varchar2(100);
exc EXCEPTION;
PRAGMA EXCEPTION_INIT(exc, -20991);
BEGIN
 IF add_grade < 0 OR add_grade > 2 then raise exc;
    elsif add_grade = 1 then description_1 := 'bardzo slabo';
    elsif add_grade = 2 then description_1 := 'super';
end if;

EXCEPTION
    WHEN exc THEN DBMS_OUTPUT.PUT_LINE('NIE WLASCIWA WARTOSC');
END;
/
EXECUTE grades(1);