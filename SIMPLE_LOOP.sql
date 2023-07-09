SET SERVEROUTPUT ON;

DECLARE
    v_lp NUMBER := 0;
BEGIN
    LOOP
        v_lp := v_lp+1;
        DBMS_OUTPUT.PUT_LINE(v_lp);
        EXIT WHEN v_lp=6;
    END LOOP;
END;
/

-- EXIT koñczy pêtlê
DECLARE
    v_lp NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('przed petl¹');
    LOOP
        DBMS_OUTPUT.PUT_LINE('œrodek pêtli przed EXIT');
        EXIT;
        DBMS_OUTPUT.PUT_LINE('œrodek pêtli po EXIT');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('po pêtli');
END;
/

-- dziala tylko w pêtli
BEGIN
    EXIT;
END;
/

-- continue
DECLARE
    v_lp NUMBER := 0;
BEGIN
    LOOP
        v_lp := v_lp+1;
        EXIT WHEN v_lp=10;
        CONTINUE WHEN mod(v_lp,2) = 0;
        DBMS_OUTPUT.PUT_LINE(v_lp);
    END LOOP;
END;
/
