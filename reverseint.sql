DECLARE
    num  NUMBER := &num;
    Reversed NUMBER := 0;
    rem NUMBER;
BEGIN

    WHILE num > 0 LOOP
        rem := MOD(num, 10);
        Reversed := (Reversed * 10) + rem;
        num := FLOOR(num / 10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Reversed Number: ' || Reversed);
END;
/