CREATE OR REPLACE PROCEDURE day_of_week (
    added_date DATE,
    day_in_word OUT VARCHAR2) IS
BEGIN 
    SELECT TO_CHAR(added_date,'D') INTO day_in_word FROM dual;
        CASE day_in_word
            WHEN 1 THEN day_in_word:= 'sunday';
            WHEN 2 THEN day_in_word:= 'monday';
            WHEN 3 THEN day_in_word:= 'thusday';
            WHEN 4 THEN day_in_word:= 'wednesday';
            WHEN 5 THEN day_in_word:= 'thursday';
            WHEN 6 THEN day_in_word:= 'friday';
            WHEN 7 THEN day_in_word:= 'saturday';
        END CASE;
    
    DBMS_OUTPUT.PUT_LINE(day_in_word);
end;
/
DECLARE 
day_ VARCHAR2(10);
BEGIN 
day_of_week(added_date=> '10/10/29', day_in_word=>day_);
end;
/
SELECT SYSDATE FROM DUAL;