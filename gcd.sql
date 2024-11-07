CREATE OR REPLACE FUNCTION gcd(a IN INTEGER, b IN OUT INTEGER) RETURN INTEGER AS
    r INTEGER;
BEGIN
    IF b = 0 THEN
        RETURN a;
    END IF;
    r := a MOD b;
    RETURN gcd(b, r);
END;


DECLARE
    a INTEGER := &a;
    b INTEGER := &b;
BEGIN
    dbms_output.put_line('GCD(' || a || ', ' || b || ') = ' || gcd(a, b));
END;
