SET SERVEROUTPUT ON

DECLARE
    n NUMBER;
    f NUMBER := 1;

BEGIN
    n := &n;
    FOR i IN 1..n LOOP
        f := f * i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || n || ' is ' || f);
END;

