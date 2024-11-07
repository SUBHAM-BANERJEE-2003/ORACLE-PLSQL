SET SERVEROUT ON;

CREATE OR REPLACE FUNCTION fibonacci(n IN NUMBER) RETURN NUMBER IS
BEGIN
    IF n = 0 THEN
        RETURN 0;
    ELSIF n = 1 THEN
        RETURN 1;
    ELSE
        RETURN fibonacci(n - 1) + fibonacci(n - 2);
    END IF;
END;

DECLARE
    n NUMBER;
BEGIN
    n := &n;
    DBMS_OUTPUT.PUT_LINE('Fibonacci Series');
    FOR i IN 0..n LOOP
        DBMS_OUTPUT.PUT_LINE(fibonacci(i));
    END LOOP;
END;
