CREATE OR REPLACE PROCEDURE even_odd(
                            v_number IN NUMBER
                            ,v_result out VARCHAR2
                            ) IS
BEGIN 
    IF MOD(v_number,  2) = 0 THEN v_result := ' liczba jest parzysta';
    ELSIF MOD(v_number, 2) <> 0 THEN v_result := 'liczba nie jest parzysta';
    ELSE v_result := 'liczba pewnie jest zerem';
    end if;
END even_odd;
/
DECLARE 
    v_res VARCHAR2(100);
BEGIN   
    even_odd(v_number => as, v_result=>v_res);
    DBMS_OUTPUT.PUT_LINE(v_res);
end;