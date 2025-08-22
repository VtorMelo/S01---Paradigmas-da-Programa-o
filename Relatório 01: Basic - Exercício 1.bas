    10 INPUT "Digite o valor da primeira prova: "; NP1
    20 INPUT "Digite o valor da segunda prova: "; NP2
    30 LET media = (VAL(NP1)+ VAL(NP2)) / 2

    40 IF media >= 60 THEN GOTO 210
    50 IF media < 30 THEN GOTO 220
    60 IF media >= 30 AND media < 60 THEN GOTO 100
    70 GOTO 200

    100 PRINT "Será necessário NP3"
    110 INPUT "Digite o valor da NP3: "; NP3
    120 IF NP3 >= 50 THEN GOTO 230
    130 GOTO 240

    200 END
    210 PRINT "Aprovado direto"
    211 GOTO 200
    220 PRINT "Reprovado direto"
    221 GOTO 200
    230 PRINT "Aprovado pela NP3"
    231 GOTO 200
    240 PRINT "Reprovado pela NP3"
    241 GOTO 200
