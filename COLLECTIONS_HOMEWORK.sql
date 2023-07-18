SET SERVEROUTPUT ON;
--zadanie 1
-- pêtla zagnie¿dzona/nested table
DECLARE 
TYPE d_table IS TABLE OF departments%ROWTYPE;
final_table d_table;
BEGIN
    SELECT * 
    BULK COLLECT INTO  final_table
    FROM departments;
        FOR i IN final_table.FIRST..final_table.LAST
        LOOP
            DBMS_OUTPUT.PUT_LINE(final_table(i).department_id || ' ' ||
                                final_table(i).department_name || ' ' ||
                                final_table(i).manager_id || ' ' ||
                                final_table(i).location_id
                                );   
        END LOOP; 
END;
/
DECLARE
TYPE d_table IS TABLE OF departments%ROWTYPE INDEX BY PLS_INTEGER;
final_table d_table;
counter INTEGER:= 1;
BEGIN
    SELECT * 
    BULK COLLECT INTO final_table 
    FROM departments;
    
    WHILE (counter <= final_table.count)
        LOOP
            DBMS_OUTPUT.PUT_LINE(final_table(counter).department_id ||' '|| final_table(counter).department_name);
            counter:=counter+1;
        END LOOP;
END;
/
DECLARE
TYPE d_table IS VARRAY(1000) OF departments%ROWTYPE;
final_table d_table := d_table();
counter INTEGER := 1;
BEGIN
NULL;
    SELECT * BULK COLLECT INTO final_table FROM departments;
        LOOP
        DBMS_OUTPUT.PUT_LINE(final_table(counter).department_id || ' '|| final_table(counter).department_name);
        counter:= counter +1;
        EXIT WHEN ( counter >= final_table.count);
        END LOOP;    
END;
/
--zadanie 2
DECLARE 
TYPE p_errors IS TABLE OF VARCHAR2(1000) INDEX BY VARCHAR2(100);
all_errors p_errors;
counter VARCHAR2(100);
BEGIN
all_errors('-6530'):= ('ACCESS_INTO_NULL');
all_errors('-6592'):= ('CASE_NOT_FOUND');
all_errors('-6592'):= ('COLLECTION_IS_NULL');
all_errors('-6511'):= ('CURSOR_A;READY_OPEN');
all_errors('-1'):= ('DUP_VA_ON_INDEX');
all_errors('-1001'):= ('INVALID_CURSOR');
all_errors('-1722'):= ('INVALID_NUMBER');
--DBMS_OUTPUT.PUT_LINE(all_errors(all_errors.FIRST));
counter:= all_errors.first;

    WHILE (all_errors.exists(counter))
        LOOP 
            DBMS_OUTPUT.PUT_LINE(all_errors(counter));
            counter:= all_errors.next(counter);
        END LOOP;  
END;
/
DECLARE
TYPE nes IS TABLE OF INTEGER;
tabl nes:= nes();
counter INTEGER;
BEGIN

FOR i IN 1..10
    LOOP 
        tabl.extend;
        tabl(i):= i;
        --DBMS_OUTPUT.PUT_LINE(tabl(i));
    END LOOP;
tabl.delete(2);
tabl.delete(5);
tabl.delete(9);
counter:= tabl.first;
WHILE (tabl.exists(counter))
    LOOP
        if (tabl(counter) = null) 
        THEN counter := tabl.next(counter);
        ELSE DBMS_OUTPUT.PUT_LINE(tabl(counter));
        counter := tabl.next(counter);
        END IF;
    END LOOP;
END;