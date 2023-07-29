SET SERVEROUTPUT ON;
SELECT * FROM employees;
select * from jobs;
select * from job_history;
select * from departments;
SELECT COUNT(*) FROM departments d 
INNER JOIN employees e ON d.department_id = e.department_id
WHERE e.department_id = 50;
/
CREATE OR REPLACE PROCEDURE check_department_vacancy (
                                dep_id  departments.department_id%TYPE,
                                number_of_employed OUT NUMBER,
                                number_of_vacancy OUT NUMBER) IS
BEGIN 
    SELECT COUNT(*) into number_of_employed
    FROM departments d INNER JOIN employees e ON d.department_id = e.department_id
    WHERE e.department_id =  dep_id;
--    number_of_employed := SQL%ROWCOUNT;
                DBMS_OUTPUT.PUT_LINE(number_of_employed);
END check_department_vacancy;
/
DECLARE 
n departments.department_id%TYPE := 50;
n_emp NUMBER(10);
n_vac NUMBER(10);
BEGIN
--null;
check_department_vacancy(dep_id => n, number_of_employed => n_emp, number_of_vacancy => n_vac);
END;