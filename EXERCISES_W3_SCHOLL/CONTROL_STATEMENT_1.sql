SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE arrange_numbers (
                            v_1 NUMBER
                            ,v_2 NUMBER) IS
var_small NUMBER;
var_big NUMBER;
BEGIN
    IF (v_1 > v_2) THEN var_big := v_1;
                        var_small := v_2;
    ELSIF (v_2 > v_1) THEN var_big := v_2;
                        var_small := v_1;
    ELSE DBMS_OUTPUT.PUT_LINE('cyfry sa identyczne');
    END IF;
END;
/
EXECUTE arrange_numbers(v_1=> 100, v_2=> 100);
