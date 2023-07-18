SET SERVEROUTPUT ON;
DECLARE 
CURSOR curr IS (SELECT * FROM regions);
row_loc regions%ROWTYPE;
BEGIN
OPEN curr;
    
    WHILE (curr%
        LOOP
        FETCH curr INTO row_loc;
        DBMS_OUTPUT.PUT_LINE(row_loc.region_name);    
        END LOOP;
        
        
        IF (curr%FOUND = true) THEN DBMS_OUTPUT.PUT_LINE('true');
        ELSIF (curr%FOUND = false) THEN DBMS_OUTPUT.PUT_LINE('false');
        ELSIF (curr%FOUND = NULL) THEN DBMS_OUTPUT.PUT_LINE('null');
        ELSE DBMS_OUTPUT.PUT_LINE('ani false ani true');
        END IF;

   

CLOSE curr;
end;
/
DECLARE 
CURSOR curr(na_me varchar2) IS (SELECT * FROM regions where region_name = na_me);
row_loc regions%ROWTYPE;
BEGIN
FOR i IN curr('Asia')
    LOOP
   -- FETCH curr INTO row_loc;
        DBMS_OUTPUT.PUT_LINE(i.region_name);
    END LOOP;
END;
/    
DECLARE
type reg is table of regions%ROWTYPE;
var_reg reg;
begin 
    SELECT * INTO reg FROM regions;
    DBMS_OUTPUT.PUT_LINE(sql%ROWCOUNT);
END;