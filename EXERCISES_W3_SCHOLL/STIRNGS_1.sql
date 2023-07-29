CREATE OR REPLACE PROCEDURE calculate_names_length is
CURSOR n_length is (SELECT first_name from employees);
begin
    for i in n_length
        loop
            DBMS_OUTPUT.PUT_LINE( '"'|| i.first_name||'"' || ' ' ||LENGTH(i.first_name));
        end loop;
end;
/
EXECUTE calculate_names_length;
            