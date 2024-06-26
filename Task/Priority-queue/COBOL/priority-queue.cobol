       PROCESS NOSEQ,DS(S),AR(E),TEST(SO),CP(1047)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PTYQTEST
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * UNCOMMENT WITH DEBUGGING CLAUSE FOR DEBUG LINES TO EXECUTE.
       SOURCE-COMPUTER.
           Z-SYSTEM
      *        WITH DEBUGGING MODE
           .

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PTYQ-PGMNAMES.
           05  PTYQPUSH          PIC  X(8) VALUE "PTYQPUSH".
           05  PTYQPOP           PIC  X(8) VALUE "PTYQPOP".

       01  TASK-PTR              POINTER.

       01  TOP-PTR               POINTER.

       01  LINK-KEY              PIC S9(8) COMP-5.

       01  HEAP-PTR              POINTER VALUE NULL.

       01  PUSHD-PTR             POINTER VALUE NULL.

       01  POPPD-PTR             POINTER VALUE NULL.

       LINKAGE SECTION.
       01  TASK.
           05  TASK-NODE.
               10  TASK-KEY      PIC S9(8) COMP-5.
               10  TASK-NEXT     POINTER.
               10  TASK-DOWN     POINTER.
           05  TASK-NAME         PIC  X(40).

       PROCEDURE DIVISION.
           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "EAT SCONES."      TO TASK-NAME
           MOVE +6 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "CLEAR DRAINS."    TO TASK-NAME
           MOVE +3 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "FEED CAT."        TO TASK-NAME
           MOVE +4 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "MAKE TEA."        TO TASK-NAME
           MOVE +5 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "SOLVE RC TASKS."  TO TASK-NAME
           MOVE +1 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           ALLOCATE TASK RETURNING TASK-PTR
           MOVE "TAX RETURN."      TO TASK-NAME
           MOVE +2 TO LINK-KEY
           CALL PTYQPUSH USING TASK-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR
           SET HEAP-PTR TO PUSHD-PTR

           PERFORM WITH TEST BEFORE UNTIL HEAP-PTR = NULL
               SET TOP-PTR TO HEAP-PTR
               SET ADDRESS OF TASK TO TOP-PTR
               DISPLAY TASK-KEY " " TASK-NAME
               CALL PTYQPOP USING HEAP-PTR, POPPD-PTR
               SET HEAP-PTR TO POPPD-PTR
               FREE TOP-PTR
           END-PERFORM
           GOBACK.
       END PROGRAM PTYQTEST.
       PROCESS NOSEQ,DS(S),AR(E),TEST(SO),CP(1047)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PTYQMERG RECURSIVE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * UNCOMMENT WITH DEBUGGING CLAUSE FOR DEBUG LINES TO EXECUTE.
       SOURCE-COMPUTER.
           Z-SYSTEM
      *        WITH DEBUGGING MODE
           .

       DATA DIVISION.

       LINKAGE SECTION.
       01  HEAP-PTRA             POINTER.

       01  HEAP-PTRB             POINTER.

       01  MERGD-PTR             POINTER.

       01  HEAPA.
           05  HEAPA-KEY         PIC S9(8) COMP-5 VALUE +0.
           05  HEAPA-NEXT        POINTER.
           05  HEAPA-DOWN        POINTER.

       01  HEAPB.
           05  HEAPB-KEY         PIC S9(8) COMP-5 VALUE +0.
           05  HEAPB-NEXT        POINTER.
           05  HEAPB-DOWN        POINTER.

       PROCEDURE DIVISION USING HEAP-PTRA, HEAP-PTRB, MERGD-PTR.
           EVALUATE TRUE
               WHEN HEAP-PTRA = NULL
                   SET MERGD-PTR TO HEAP-PTRB
               WHEN HEAP-PTRB = NULL
                   SET MERGD-PTR TO HEAP-PTRA
               WHEN OTHER
                   SET ADDRESS OF HEAPA TO HEAP-PTRA
                   SET ADDRESS OF HEAPB TO HEAP-PTRB
                   IF HEAPA-KEY < HEAPB-KEY
                       IF HEAPA-DOWN NOT = NULL
                           SET HEAPB-NEXT TO HEAPA-DOWN
                       END-IF
                       SET HEAPA-DOWN TO HEAP-PTRB
                       SET MERGD-PTR TO HEAP-PTRA
                   ELSE
                       IF HEAPB-DOWN NOT = NULL
                           SET HEAPA-NEXT TO HEAPB-DOWN
                       END-IF
                       SET HEAPB-DOWN TO HEAP-PTRA
                       SET MERGD-PTR TO HEAP-PTRB
                   END-IF
           END-EVALUATE
           GOBACK.
       END PROGRAM PTYQMERG.
       PROCESS NOSEQ,DS(S),AR(E),TEST(SO),CP(1047)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PTYQ2PMG RECURSIVE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * UNCOMMENT WITH DEBUGGING CLAUSE FOR DEBUG LINES TO EXECUTE.
       SOURCE-COMPUTER.
           Z-SYSTEM
      *        WITH DEBUGGING MODE
           .

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PGMQMERG              PIC  X(8) VALUE "PTYQMERG".
       01  PGMQ2PMG              PIC  X(8) VALUE "PTYQ2PMG".

       LOCAL-STORAGE SECTION.
       01  HEAP-PTRA             POINTER.

       01  HEAP-PTRB             POINTER.

       01  HEAP-REST             POINTER.

       01  MERG1-PTR             POINTER.

       01  MERG2-PTR             POINTER.

       LINKAGE SECTION.
       01  HEAP-PTR              POINTER.

       01  MERGD-PTR             POINTER.

       01  HEAP.
           05  HEAP-KEY          PIC S9(8) COMP-5 VALUE +0.
           05  HEAP-NEXT         POINTER.
           05  HEAP-DOWN         POINTER.

       01  HEAPA.
           05  HEAPA-KEY         PIC S9(8) COMP-5 VALUE +0.
           05  HEAPA-NEXT        POINTER.
           05  HEAPA-DOWN        POINTER.

       01  HEAPB.
           05  HEAPB-KEY         PIC S9(8) COMP-5 VALUE +0.
           05  HEAPB-NEXT        POINTER.
           05  HEAPB-DOWN        POINTER.

       01  REST.
           05  REST-KEY          PIC S9(8) COMP-5 VALUE +0.
           05  REST-NEXT         POINTER.
           05  REST-DOWN         POINTER.

       PROCEDURE DIVISION USING HEAP-PTR, MERGD-PTR.
           SET ADDRESS OF HEAP TO HEAP-PTR
           EVALUATE TRUE
               WHEN HEAP-PTR = NULL
                   SET MERGD-PTR TO HEAP-PTR
               WHEN HEAP-NEXT = NULL
                   SET MERGD-PTR TO HEAP-PTR
               WHEN OTHER
                   SET HEAP-PTRA TO HEAP-PTR
                   SET ADDRESS OF HEAPA TO HEAP-PTRA
                   SET HEAP-PTRB TO HEAP-NEXT
                   SET ADDRESS OF HEAPB TO HEAP-PTRB
                   SET HEAP-REST TO HEAPB-NEXT
                   SET ADDRESS OF REST  TO HEAP-REST
                   SET HEAPA-NEXT TO NULL
                   SET HEAPB-NEXT TO NULL
                   CALL PGMQMERG USING HEAP-PTRA, HEAP-PTRB, MERG1-PTR
                   CALL PGMQ2PMG USING HEAP-REST, MERG2-PTR
                   CALL PGMQMERG USING MERG1-PTR, MERG2-PTR, MERGD-PTR
           END-EVALUATE
           GOBACK.
       END PROGRAM PTYQ2PMG.
       PROCESS NOSEQ,DS(S),AR(E),TEST(SO),CP(1047)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PTYQPUSH RECURSIVE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * UNCOMMENT WITH DEBUGGING CLAUSE FOR DEBUG LINES TO EXECUTE.
       SOURCE-COMPUTER.
           Z-SYSTEM
      *        WITH DEBUGGING MODE
           .

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PTYQMERG              PIC  X(8) VALUE "PTYQMERG".

       LINKAGE SECTION.
       01  NODE-PTR              POINTER.

       01  LINK-KEY              PIC S9(8) COMP-5.

       01  HEAP-PTR              POINTER.

       01  PUSHD-PTR             POINTER.

       01  HEAP.
           05  HEAP-KEY          PIC S9(8) COMP-5.
           05  HEAP-NEXT         POINTER.
           05  HEAP-DOWN         POINTER.

       01  NODE.
           05  NODE-KEY          PIC S9(8) COMP-5.
           05  NODE-NEXT         POINTER.
           05  NODE-DOWN         POINTER.

       PROCEDURE DIVISION USING NODE-PTR, LINK-KEY, HEAP-PTR, PUSHD-PTR.
           SET ADDRESS OF NODE TO NODE-PTR
           SET ADDRESS OF HEAP TO HEAP-PTR
           SET NODE-NEXT TO NULL
           SET NODE-DOWN TO NULL
           MOVE LINK-KEY TO NODE-KEY
           CALL PTYQMERG USING NODE-PTR, HEAP-PTR, PUSHD-PTR
           GOBACK.
       END PROGRAM PTY2PUSH.
       PROCESS NOSEQ,DS(S),AR(E),TEST(SO),CP(1047)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PTYQPOP RECURSIVE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * UNCOMMENT WITH DEBUGGING CLAUSE FOR DEBUG LINES TO EXECUTE.
       SOURCE-COMPUTER.
           Z-SYSTEM
      *        WITH DEBUGGING MODE
           .

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PTYQ2PMG              PIC  X(8) VALUE "PTYQ2PMG".

       LINKAGE SECTION.
       01  HEAP-PTR              POINTER.

       01  POPPD-PTR             POINTER.

       01  HEAP.
           05  HEAP-KEY          PIC S9(8) COMP-5 VALUE +0.
           05  HEAP-NEXT         POINTER.
           05  HEAP-DOWN         POINTER.

       PROCEDURE DIVISION USING HEAP-PTR, POPPD-PTR.
           SET ADDRESS OF HEAP TO HEAP-PTR
           CALL PTYQ2PMG USING HEAP-DOWN, POPPD-PTR
           GOBACK.
       END PROGRAM PTYQPOP.
