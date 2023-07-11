
SET SERVEROUTPUT ON;

-- przyk³ad 1
BEGIN
   --DBMS_OUTPUT.PUT_LINE('polecenie 1');
   RAISE_APPLICATION_ERROR(-20001, 'polecenie 1');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk³ad 2
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
        DBMS_OUTPUT.PUT_LINE('ex_wyjatek: wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHERS: wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
END;
/

-- przyk³ad 4
DECLARE
    v_user_birthdate DATE := TO_DATE('2004-04-05', 'YYYY-MM-DD');
    v_age 			 NUMBER;
BEGIN
    SELECT months_between(TRUNC(sysdate), v_user_birthdate)/12 as age 
      INTO v_age
      FROM dual;


    IF v_age < 18 THEN
     RAISE_APPLICATION_ERROR(-20999, 'Nie jesteœ pe³noletni. Musisz opuœciæ stronê.');
    END IF;
END;
/

-- przyk³ad 5
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
        DBMS_OUTPUT.PUT_LINE('wyst¹pi³ b³¹d o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
        --RAISE;
       -- RAISE_APPLICATION_ERROR(-20999, 'Nie jesteœ pe³noletni. Musisz opuœciæ stronê.');
END;
/

-- przyk³ad 6
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
        RAISE_APPLICATION_ERROR(-20999, 'Poda³eœ niepoprawne dane, nie mo¿esz siê zalogowaæ. ');
END;
/

-- przyk³ad 7
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
            DBMS_OUTPUT.PUT_LINE('logujemy wyj¹tek lub robimy coœ innego, co potrzebne z technicznego punktu widzenia');
            RAISE_APPLICATION_ERROR(-20999, 'Podajemy informacje, która zostanie zwrócona nietechnicznemu u¿ytkownikowi(jeœli to konieczne)');
    END;
END;
/
