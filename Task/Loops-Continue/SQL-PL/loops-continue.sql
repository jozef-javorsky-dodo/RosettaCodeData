--#SET TERMINATOR @

SET SERVEROUTPUT ON @

BEGIN
 DECLARE I SMALLINT DEFAULT 1;

 Loop: WHILE (I <= 10) DO
  CALL DBMS_OUTPUT.PUT(I);
  SET I = I + 1;
  IF (MOD(I - 1, 5) = 0) THEN
   CALL DBMS_OUTPUT.PUT_LINE(' ');
   ITERATE Loop;
  END IF;
  CALL DBMS_OUTPUT.PUT(', ');
 END WHILE Loop;
END @
