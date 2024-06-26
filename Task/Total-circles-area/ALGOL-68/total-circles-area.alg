BEGIN # caclulate an approximation to the total of some overlapping circles  #
      # translated from the Nim sample                                       #

    MODE CIRCLE = STRUCT( REAL x, y, r );

    []CIRCLE circles =  ( (  1.6417233788,  1.6121789534, 0.0848270516 )
                        , ( -1.4944608174,  1.2077959613, 1.1039549836 )
                        , (  0.6110294452, -0.6907087527, 0.9089162485 )
                        , (  0.3844862411,  0.2923344616, 0.2375743054 )
                        , ( -0.2495892950, -0.3832854473, 1.0845181219 )
                        , (  1.7813504266,  1.6178237031, 0.8162655711 )
                        , ( -0.1985249206, -0.8343333301, 0.0538864941 )
                        , ( -1.7011985145, -0.1263820964, 0.4776976918 )
                        , ( -0.4319462812,  1.4104420482, 0.7886291537 )
                        , (  0.2178372997, -0.9499557344, 0.0357871187 )
                        , ( -0.6294854565, -1.3078893852, 0.7653357688 )
                        , (  1.7952608455,  0.6281269104, 0.2727652452 )
                        , (  1.4168575317,  1.0683357171, 1.1016025378 )
                        , (  1.4637371396,  0.9463877418, 1.1846214562 )
                        , ( -0.5263668798,  1.7315156631, 1.4428514068 )
                        , ( -1.2197352481,  0.9144146579, 1.0727263474 )
                        , ( -0.1389358881,  0.1092805780, 0.7350208828 )
                        , (  1.5293954595,  0.0030278255, 1.2472867347 )
                        , ( -0.5258728625,  1.3782633069, 1.3495508831 )
                        , ( -0.1403562064,  0.2437382535, 1.3804956588 )
                        , (  0.8055826339, -0.0482092025, 0.3327165165 )
                        , ( -0.6311979224,  0.7184578971, 0.2491045282 )
                        , (  1.4685857879, -0.8347049536, 1.3670667538 )
                        , ( -0.6855727502,  1.6465021616, 1.0593087096 )
                        , (  0.0152957411,  0.0638919221, 0.9771215985 )
                        );

    OP   SQR = ( REAL x )REAL: x * x;

    PRIO MIN = 5;
    OP   MIN = ( []CIRCLE rc, PROC(CIRCLE)REAL f )REAL:
         IF   LWB rc > UPB rc
         THEN 0
         ELSE REAL result := f( rc[ LWB rc ] );
              FOR c pos FROM LWB rc + 1 TO UPB rc DO
                  REAL v = f( rc[ c pos ] );
                  IF v < result THEN result := v FI
              OD;
              result
         FI # MIN # ;
    PRIO MAX = 5;
    OP   MAX = ( []CIRCLE rc, PROC(CIRCLE)REAL f )REAL:
         IF   LWB rc > UPB rc
         THEN 0
         ELSE REAL result := f( rc[ LWB rc ] );
              FOR c pos FROM LWB rc + 1 TO UPB rc DO
                  REAL v = f( rc[ c pos ] );
                  IF v > result THEN result := v FI
              OD;
              result
         FI # MAX # ;

    REAL x min = circles MIN ( ( CIRCLE it )REAL: x OF it - r OF it );
    REAL x max = circles MAX ( ( CIRCLE it )REAL: x OF it + r OF it );
    REAL y min = circles MIN ( ( CIRCLE it )REAL: y OF it - r OF it );
    REAL y max = circles MAX ( ( CIRCLE it )REAL: y OF it + r OF it );

    INT  box side = 500;

    REAL dx = ( x max - x min ) / box side;
    REAL dy = ( y max - y min ) / box side;

    INT count := 0;

    FOR r FROM 0 TO box side - 1 DO
        REAL y = y min + ( r * dy );
        FOR c FROM 0 TO box side - 1 DO
            REAL x = x min + ( c * dx );
            BOOL xy in circle := FALSE;
            FOR c pos FROM LWB circles TO UPB circles WHILE NOT xy in circle DO
                CIRCLE curr circle = circles[ c pos ];
                IF SQR ( x - x OF curr circle ) + SQR ( y - y OF curr circle ) <= SQR r OF curr circle THEN
                    count       +:= 1;
                    xy in circle := TRUE
                FI
            OD
        OD
    OD;

    print( ( "Approximated area: ", fixed( count * dx * dy, -16, 14 ), newline ) )

END
