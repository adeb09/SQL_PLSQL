SET SERVEROUTPUT ON;
DECLARE
int1 INTERVAL YEAR(2) TO MONTH;
int2 INTERVAL DAY(3) TO SECOND(2);
int3 INTERVAL DAY(3) TO SECOND(2);
dt date;

BEGIN
int1 := INTERVAL '05-04' YEAR TO MONTH;
int2 := INTERVAL '15' DAY;
int3 := INTERVAL '45' SECOND;
dt := SYSDATE + int1  + int2  + int3;
DBMS_OUTPUT.PUT_LINE(TO_CHAR(dt,'YYYY-MM-DD-HH:MI:SS'));

END;
/