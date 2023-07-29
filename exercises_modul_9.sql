SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION higher_salary( salary NUMBER) RETURN NUMBER IS
less_5000 NUMBER:= 0.20;
beetween_5_7 NUMBER := 0.15;
over_7 NUMBER := 0.10;
new_salary NUMBER;
invalid_salary EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_salary, -20111);
v_boolean BOOLEAN:= TRUE;
    
    BEGIN
    CASE v_boolean
        WHEN salary < 5000 AND salary > 0 THEN new_salary:= salary + (salary * less_5000);
        WHEN salary >= 5000 AND salary <= 7000 THEN new_salary := salary +(salary * beetween_5_7);
        WHEN salary > 7000 THEN new_salary := salary +(salary * over_7);
        ELSE RAISE invalid_salary;
    END CASE;
RETURN new_salary;
EXCEPTION
    WHEN invalid_salary  THEN DBMS_OUTPUT.PUT_LINE('nieprawidlowa podana kwota');
END;
/
DECLARE 
salary NUMBER;
    BEGIN 
        salary:= higher_salary(-1);
        DBMS_OUTPUT.PUT_LINE(salary);
       end;
/
CREATE OR REPLACE PROCEDURE replace_salary(
                                    dep_id departments.department_id%TYPE) IS

TYPE r_id_salary IS RECORD(id_ employees.employee_id%TYPE
                            ,salary employees.salary%TYPE);
TYPE t_id_salary IS TABLE OF r_id_salary;
t_final t_id_salary;
BEGIN
    SELECT employee_id, salary 
    BULK COLLECT INTO t_final
    FROM employees WHERE department_id = dep_id ;
    
    --    UPDATE employees SET salary = higher_salary(salary) where department_id = dep_id; 
       FOR i IN 1..t_final.count
            loop
                DBMS_OUTPUT.PUT_LINE(t_final(i).id_ || ' ' || t_final(i).salary);
                t_final(i).salary := higher_salary(t_final(i).salary);  
                DBMS_OUTPUT.PUT_LINE(t_final(i).id_ || ' ' || t_final(i).salary);    
                DBMS_OUTPUT.PUT_LINE(CHR(10));
           end loop;
       FOR i IN 1..t_final.count
        loop
        UPDATE employees SET salary = t_final(i).salary where employee_id = t_final(i).id_;
        end loop;
END;
/
execute replace_salary(50);
/
rollback;
      
SELECT *FROM EMPLOYEES WHERE department_id = 50;
    