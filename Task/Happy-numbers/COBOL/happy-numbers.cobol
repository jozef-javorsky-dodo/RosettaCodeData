       IDENTIFICATION DIVISION.
       PROGRAM-ID. HAPPY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VARIABLES.
          03 CANDIDATE        PIC 9(4).
          03 SQSUM-IN         PIC 9(4).
          03 FILLER           REDEFINES SQSUM-IN.
             05 DIGITS        PIC 9 OCCURS 4 TIMES.
          03 SQUARE           PIC 9(4).
          03 SUM-OF-SQUARES   PIC 9(4).
          03 N                PIC 9.
          03 TORTOISE         PIC 9(4).
          03 HARE             PIC 9(4).
             88 HAPPY         VALUE 1.
          03 SEEN             PIC 9 VALUE ZERO.
          03 OUT-FMT          PIC ZZZ9.

       PROCEDURE DIVISION.
       BEGIN.
           PERFORM DISPLAY-IF-HAPPY VARYING CANDIDATE FROM 1 BY 1
           UNTIL SEEN IS EQUAL TO 8.
           STOP RUN.

       DISPLAY-IF-HAPPY.
           PERFORM CHECK-HAPPY.
           IF HAPPY,
               MOVE CANDIDATE TO OUT-FMT,
               DISPLAY OUT-FMT,
               ADD 1 TO SEEN.

       CHECK-HAPPY.
           MOVE CANDIDATE TO TORTOISE, SQSUM-IN.
           PERFORM CALC-SUM-OF-SQUARES.
           MOVE SUM-OF-SQUARES TO HARE.
           PERFORM CHECK-HAPPY-STEP UNTIL TORTOISE IS EQUAL TO HARE.

       CHECK-HAPPY-STEP.
           MOVE TORTOISE TO SQSUM-IN.
           PERFORM CALC-SUM-OF-SQUARES.
           MOVE SUM-OF-SQUARES TO TORTOISE.
           MOVE HARE TO SQSUM-IN.
           PERFORM CALC-SUM-OF-SQUARES.
           MOVE SUM-OF-SQUARES TO SQSUM-IN.
           PERFORM CALC-SUM-OF-SQUARES.
           MOVE SUM-OF-SQUARES TO HARE.

       CALC-SUM-OF-SQUARES.
           MOVE ZERO TO SUM-OF-SQUARES.
           PERFORM ADD-DIGIT-SQUARE VARYING N FROM 1 BY 1
           UNTIL N IS GREATER THAN 4.

       ADD-DIGIT-SQUARE.
           MULTIPLY DIGITS(N) BY DIGITS(N) GIVING SQUARE.
           ADD SQUARE TO SUM-OF-SQUARES.
