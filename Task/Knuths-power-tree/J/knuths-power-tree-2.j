   knuth_power_tree 191 NB. generate sufficiently large tree
0 1 1 2 2 3 3 5 4 6 5 10 6 10 7 10 8 16 9 14 10 14 11 13 12 15 13 18 14 28 15 28 16 17 17 21 18 36 19 26 20 40 21 40 22 30 23 42 24 48 25 48 26 52 27 44 28 38 29 31 30 56 31 42 32 64 33 66 34 46 35 57 36 37 37 50 38 76 39 76 40 41 41 43 42 80 43 84 44 47 45 70 46 62 47 57 48 49 49 51 50 100 51 100 52 70 53 104 54 104 55 108 56 112 57 112 58 61 59 112 60 120 61 120 62 75 63 126 64 65 65 129 66 67 67 90 68 136 69 138 70 140 71 140 72 144 73 144 74 132 75 138 76 144 77 79 78 152 79 152 80 160 81 160 82 85 83 162 84 168 85 114 86 168 87 105 88 118 89 176 90 176 91 122 92 184 93 176 94 126 95 190

   findpath 0
0
   2 usepath 0
1

   findpath 1
1
   2 usepath 1
2

   findpath 2
1 2
   2 usepath 2
4

   findpath 3
1 2 3
   2 usepath 3
8

   findpath 4
1 2 4
   2 usepath 4
16

   findpath 5
1 2 3 5
   2 usepath 5
32

   findpath 6
1 2 3 6
   2 usepath 6
64

   findpath 7
1 2 3 5 7
   2 usepath 7
128

   findpath 8
1 2 4 8
   2 usepath 8
256

   findpath 9
1 2 3 6 9
   2 usepath 9
512

   findpath 10
1 2 3 5 10
   2 usepath 10
1024

   findpath 11
1 2 3 5 10 11
   2 usepath 11
2048

   findpath 12
1 2 3 6 12
   2 usepath 12
4096

   findpath 13
1 2 3 5 10 13
   2 usepath 13
8192

   findpath 14
1 2 3 5 7 14
   2 usepath 14
16384

   findpath 15
1 2 3 5 10 15
   2 usepath 15
32768

   findpath 16
1 2 4 8 16
   2 usepath 16
65536

   findpath 17
1 2 4 8 16 17
   2 usepath 17
131072

   findpath 191
1 2 3 5 7 14 19 38 57 95 190 191
   3x usepath 191
13494588674281093803728157396523884917402502294030101914066705367021922008906273586058258347

   findpath 81
1 2 3 5 10 20 40 41 81
   (x:1.1) usepath 81
2253240236044012487937308538033349567966729852481170503814810577345406584190098644811r1000000000000000000000000000000000000000000000000000000000000000000000000000000000