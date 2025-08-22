  10 LET numero = INT(100*RND(1))
  20 PRINT "Tente adivinhar o número (0 a 100)"
  30 INPUT "Digite seu palpite: "; palpite
  40 IF palpite = numero THEN GOTO 200
  50 IF palpite < numero THEN GOTO 120
  60 IF palpite > numero THEN GOTO 140

  120 PRINT "O número correto é MAIOR que " + palpite
  130 GOTO 30

  140 PRINT "O número correto é MENOR que " + palpite
  150 GOTO 30

  200 PRINT "Parabéns! Você acertou o número!"
  210 END
