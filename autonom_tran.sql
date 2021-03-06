SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE autonom_pkg AS
PROCEDURE updt_fact(str VARCHAR2 );
END autonom_pkg;
/

CREATE OR REPLACE PACKAGE BODY autonom_pkg AS
PROCEDURE updt_fact(str VARCHAR2 )  IS
PRAGMA AUTONOMOUS_TRANSACTION;
fct1 NUMBER(10);
BEGIN
fct1 := length(str);
UPDATE FACTORS SET FACTOR2 = FACTOR1 + fct1 WHERE FACTOR1 + FACTOR2 >= 120;
INSERT INTO FACTORS VALUES(fct1,fct1 + 25);
COMMIT;
END updt_fact;
END autonom_pkg;
/



DECLARE
br GLIF3.BRCH%TYPE;
CURSOR c1 IS SELECT BRCH INTO br FROM GLIF3;

BEGIN
OPEN c1;
LOOP
FETCH c1 INTO br;
EXIT WHEN c1%NOTFOUND;
IF MOD(TO_NUMBER(br),5) = 0 THEN
SAVEPOINT BEFUPDT;
UPDATE FACTORS2 SET FACTOR1 = FACTOR1 - 5 WHERE FACTOR2 > 45;
autonom_pkg.updt_fact(br);
ROLLBACK TO BEFUPDT;
--COMMIT;
INSERT INTO FACTORS2 VALUES(TO_NUMBER(br), 5);
--COMMIT;
END IF;

END LOOP;
END;
/