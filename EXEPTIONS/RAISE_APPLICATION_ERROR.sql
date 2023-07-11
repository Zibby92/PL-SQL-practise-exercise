
SET SERVEROUTPUT ON;

-- przyk�ad 1
BEGIN
   --DBMS_OUTPUT.PUT_LINE('polecenie 1');
   RAISE_APPLICATION_ERROR(-20001, 'polecenie 1');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk�ad 2
DECLARE
    v_kod 		NUMBER := -20001;
    v_komunikat VARCHAR2(4000);
BEGIN
   v_komunikat := '';
  
   RAISE_APPLICATION_ERROR(v_kod, v_komunikat);
END;
/

-- przykad 3
DECLARE
    v_kod 		NUMBER 			:= -20001;
    v_komunikat VARCHAR2(4000)	:= 'tekst';
    ex_wyjatek 	EXCEPTION ;
    PRAGMA EXCEPTION_INIT(ex_wyjatek, -20001);
BEGIN
   RAISE_APPLICATION_ERROR(v_kod, v_komunikat, TRUE);
EXCEPTION
    WHEN ex_wyjatek THEN
        DBMS_OUTPUT.PUT_LINE('ex_wyjatek: wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHERS: wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk�ad 4
DECLARE
    v_user_birthdate DATE := TO_DATE('2004-04-05', 'YYYY-MM-DD');
    v_age 			 NUMBER;
BEGIN
    SELECT months_between(TRUNC(sysdate), v_user_birthdate)/12 as age 
      INTO v_age
      FROM dual;


    IF v_age < 18 THEN
     RAISE_APPLICATION_ERROR(-20999, 'Nie jeste� pe�noletni. Musisz opu�ci� stron�.');
    END IF;
END;
/

-- przyk�ad 5
DECLARE
    v_user_birthdate DATE 		:= TO_DATE('2004-04-05', 'YYYY-MM-DD');
    v_age 			 NUMBER;
    ex_too_young 	 EXCEPTION;
BEGIN
    SELECT months_between(TRUNC(sysdate), v_user_birthdate)/12 as age 
      INTO v_age
      FROM dual;
    
    IF v_age < 18 THEN
     RAISE ex_too_young;
    END IF;
    
EXCEPTION
    WHEN ex_too_young THEN
        DBMS_OUTPUT.PUT_LINE('wyst�pi� b��d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
        --RAISE;
       -- RAISE_APPLICATION_ERROR(-20999, 'Nie jeste� pe�noletni. Musisz opu�ci� stron�.');
END;
/

-- przyk�ad 6
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id
      INTO v_emp_id
      FROM employees
     WHERE employee_id=350
    ;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20999, 'Poda�e� niepoprawne dane, nie mo�esz si� zalogowa�. ');
END;
/

-- przyk�ad 7
DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    BEGIN
        SELECT employee_id
          INTO v_emp_id
          FROM employees
         WHERE employee_id=350
        ;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('logujemy wyj�tek lub robimy co� innego, co potrzebne z technicznego punktu widzenia');
            RAISE_APPLICATION_ERROR(-20999, 'Podajemy informacje, kt�ra zostanie zwr�cona nietechnicznemu u�ytkownikowi(je�li to konieczne)');
    END;
END;
/
