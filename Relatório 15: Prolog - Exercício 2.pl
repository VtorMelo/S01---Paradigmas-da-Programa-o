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

concluiu(maria, programacao1).
concluiu(maria, calculo1).
concluiu(joao, programacao1).
concluiu(joao, estrutura_dados).
concluiu(joao, calculo1).
concluiu(ana, programacao1).
concluiu(ana, redes).
concluiu(ana, teoria_grafos).
concluiu(pedro, calculo1).
concluiu(pedro, estatistica).
concluiu(pedro, teoria_grafos).
concluiu(lucas, estrutura_dados).
concluiu(lucas, algoritmos).
concluiu(lucas, redes).
concluiu(lucas, banco_dados).

falta_concluir(Aluno, Disciplina) :-
    prerequisito(Disciplina, _Materia),
    \+ concluiu(Aluno, Disciplina).

aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _Cred, Area),
    Area \= fundamental,
    findall(P, prerequisito(P, Disciplina), Ps0),
    sort(Ps0, Ps),
    forall(member(P, Ps), concluiu(Aluno, P)).

aluno_apto_lista(Aluno, ListaUnica) :-
    findall(D, aluno_apto(Aluno, D), Ds),
    sort(Ds, ListaUnica).
