       IDENTIFICATION DIVISION.
       PROGRAM-ID. THUE-MORSE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STRINGS.
          03 CURRENT-STATE      PIC X(64).
          03 TEMP               PIC X(64).

       PROCEDURE DIVISION.
       BEGIN.
           MOVE "0" TO CURRENT-STATE.
           PERFORM THUE-MORSE-STEP 8 TIMES.
           DISPLAY CURRENT-STATE.
           STOP RUN.

       THUE-MORSE-STEP.
           MOVE CURRENT-STATE TO TEMP.
           INSPECT TEMP REPLACING ALL '0' BY 'X'.
           INSPECT TEMP REPLACING ALL '1' BY '0'.
           INSPECT TEMP REPLACING ALL 'X' BY '1'.
           STRING CURRENT-STATE DELIMITED BY SPACE,
                  TEMP DELIMITED BY SPACE
                  INTO CURRENT-STATE.