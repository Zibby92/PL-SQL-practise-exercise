SET SERVEROUTPUT ON;
TYPE letter_and_number IS RECORD (letter CHAR, l_number NUMBER);
CREATE TYPE t_of_chars IS TABLE OF char;

/
CREATE OR REPLACE FUNCTION count_letters (v_word VARCHAR2) RETURN t_of_chars IS
final_table t_of_chars := t_of_chars();
v_letter_temporary varchar2(100);

BEGIN
        FOR i IN 1..LENGTH(v_word)
            LOOP
                v_letter_temporary := SUBSTR(REPLACE(v_word,' '),i,1); 
                if (v_letter_temporary = null) or (v_letter_temporary = ' ') then continue;
                END IF;
                dbms_output.put_line(v_letter_temporary);
                final_table.extend;
                 final_table(i):= v_letter_temporary;
            END LOOP;
    
RETURN final_table;
END;
/
SELECT count(*),column_value FROM table(count_letters('jakis inny napis')) where column_value is not null group by column_value;
/
DECLARE 
bool boolean;
t_of t_of_chars  := t_of_chars();
BEGIN 

t_of := count_letters('');

SELECT * FROM table(count_letters(''));
/*    FOR i IN 1..t_of.count
        loop 
            dbms_output.put_line(t_of(i));
        end loop;
*/
null;
end;