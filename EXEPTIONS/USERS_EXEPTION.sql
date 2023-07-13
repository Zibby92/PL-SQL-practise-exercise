
DECLARE
    v_pit 		 NUMBER;
    ex_wrong_pit EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_wrong_pit, -2000);
BEGIN
     v_pit := 21;
     
     IF v_pit NOT IN ('18', '19', '32') THEN
        RAISE ex_wrong_pit;
     END IF;
EXCEPTION
    WHEN ex_wrong_pit THEN
        DBMS_OUTPUT.PUT_LINE('Pit ma niepoprawn¹ wartoœæ: '||v_pit);
END;
/