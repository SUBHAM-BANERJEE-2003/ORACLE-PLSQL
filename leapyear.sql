declare
  v_year number;
  v_leapyear varchar2(10);
begin
    v_year := 2000;
    if mod(v_year, 4) = 0 and (mod(v_year, 100) != 0 or mod(v_year, 400) = 0) then
        v_leapyear := 'Leap Year';
    else
        v_leapyear := 'Not Leap Year';
    end if;
    dbms_output.put_line(v_year || ' is ' || v_leapyear);
    end;
/
