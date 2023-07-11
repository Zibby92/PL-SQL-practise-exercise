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

-- EXIT ko�czy p�tl�
DECLARE
    v_lp NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('przed petl�');
    LOOP
        DBMS_OUTPUT.PUT_LINE('�rodek p�tli przed EXIT');
        EXIT;
        DBMS_OUTPUT.PUT_LINE('�rodek p�tli po EXIT');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('po p�tli');
END;
/

-- dziala tylko w p�tli
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
