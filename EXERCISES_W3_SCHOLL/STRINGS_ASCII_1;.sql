set serveroutput on;
DECLARE
TYPE t_of_char IS TABLE OF CHAR;
v_char t_of_char;
begin 
--dbms_output.put_line ( ASCII('A'));
--DBMS_OUTPUT.PUT_LINE (SUBSTR('JAKIS',1,1));
FOR i IN 1..LENGTH('wyraz')
    LOOP
        v_char.extend(length('wyraz'));
        SELECT SUBSTR('wyraz',i,1)
        bulk collect into v_char(i)
        FROM dual;
        DBMS_OUTPUT.PUT_LINE(v_char(i));
    END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_char.count);
  /*  for i IN 1..v_char.COUNT
        LOOP    
        DBMS_OUTPUT.PUT_LINE(v_char(i));
        END LOOP; */
end;