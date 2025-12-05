disciplina(programacao1, 6, fundamental).
disciplina(calculo1, 8, matematica).
disciplina(estrutura_dados, 6, computacao).
disciplina(algoritmos, 4, computacao).
disciplina(banco_dados, 6, aplicacoes).
disciplina(redes, 4, aplicacoes).
disciplina(inteligencia_artificial, 8, computacao).
disciplina(compiladores, 6, computacao).
disciplina(teoria_grafos, 4, matematica).
disciplina(estatistica, 6, matematica).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(projeto_integrador, 10, aplicacoes).

prerequisito(estrutura_dados, programacao1).
prerequisito(algoritmos, estrutura_dados).
prerequisito(banco_dados, programacao1).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, calculo1).
prerequisito(compiladores, algoritmos).
prerequisito(compiladores, estrutura_dados).
prerequisito(sistemas_operacionais, estrutura_dados).
prerequisito(teoria_grafos, calculo1).
prerequisito(estatistica, calculo1).
prerequisito(projeto_integrador, banco_dados).
prerequisito(projeto_integrador, sistemas_operacionais).

alto_impacto(D) :-
    setof(D0, Cred^D1^D2^(
        disciplina(D0, Cred, _),
        Cred > 5,
        prerequisito(D1, D0),
        prerequisito(D2, D0),
        D1 @< D2
    ), Ds),
    member(D, Ds).
