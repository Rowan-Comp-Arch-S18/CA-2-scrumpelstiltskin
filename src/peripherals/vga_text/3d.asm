
MOVZ X29, 12288
MOVZ X28, 12290

MOVZ X0, 15
MOVZ X1, 0
MOVZ X2, 0

MOVZ X3, 0
MOVZ X4, 15
MOVZ X5, 15

ORR X9, X9, X28
MOVZ X10, 32

STUR X10, [X9, 0]
ADDI X9, X9, 1
ADDI X10, X10, 1
SUBI X8, X10, 112
CBNZ X8, -5

MOVZ X7, 0

SUBI X8, X7, 0
CBNZ X8, 6
ADDI X1, X1, 1
SUBI X4, X4, 1
SUBI X8, X1, 15
CBNZ X8, 1
MOVZ X7, 1
B 40
SUBI X8, X7, 1
CBNZ X8, 6
SUBI X0, X0, 1
ADDI X3, X3, 1
SUBI X8, X0, 0
CBNZ X8, 1
MOVZ X7, 2
B 32
SUBI X8, X7, 2
CBNZ X8, 6
ADDI X2, X2, 1
SUBI X5, X5, 1
SUBI X8, X2, 15
CBNZ X8, 1
MOVZ X7, 3
B 24
SUBI X8, X7, 3
CBNZ X8, 6 SUBI X1, X1, 1
ADDI X4, X4, 1
SUBI X8, X1, 0
CBNZ X8, 1
MOVZ X7, 4
B 16
SUBI X8, X7, 4
CBNZ X8, 6
ADDI X0, X0, 1
SUBI X3, X3, 1
SUBI X8, X0, 15
CBNZ X8, 1
MOVZ X7, 5
B 8
SUBI X8, X7, 5
CBNZ X8, 6
SUBI X2, X2, 1
ADDI X5, X5, 1
SUBI X8, X2, 0
CBNZ X8, 1
MOVZ X7, 0
B 0
MOVZ X6, 0
ORR X6, X6, X2
LSL X6, X6, 4
ORR X6, X6, X1
LSL X6, X6, 4
ORR X6, X6, X0
STUR X6, [X29, 0]
MOVZ X15, 0
ORR X15, X15, X5
LSL X15, X15, 4
ORR X15, X15, X4
LSL X15, X15, 4
ORR X15, X15, X3
STUR X15, [X29, 1]
MOVZ X12, 1
LSL X12, X12, 17
SUBI X12, X12, 1
CBNZ X12, -2
B -67


B -1
