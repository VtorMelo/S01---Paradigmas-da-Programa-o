% Fatos: Progenitores (pai_ou_mae, filho) - HIERARQUIA AMPLIADA
progenitor(urano, cronos).
progenitor(gaia, cronos).
progenitor(urano, oceano).
progenitor(gaia, oceano).
progenitor(cronos, zeus).
progenitor(reia, zeus).
progenitor(cronos, poseidon).
progenitor(reia, poseidon).
progenitor(cronos, hades). % Hades adicionado
progenitor(reia, hades). % Hades adicionado
progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).
progenitor(zeus, artemis).
progenitor(letó, artemis).
progenitor(zeus, ares).
progenitor(hera, ares).
progenitor(zeus, hefesto).
progenitor(hera, hefesto).
progenitor(poseidon, tritao).
progenitor(zeus, perseu). % Herói, filho de um deus
progenitor(dânae, perseu).
progenitor(atena, erictônio).

% Fatos: Poderes e Domínios
dominio(zeus, ceu).
dominio(zeus, trovão).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).
dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).
dominio(ares, guerra_brutal).
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, caça).
dominio(artemis, lua).
dominio(hefesto, fogo).
dominio(hefesto, forja).
dominio(afrodite, beleza).
dominio(afrodite, amor).
dominio(cronos, tempo).

% Fatos: Armas e Artefatos (deus, arma)
arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

% Fatos: Características e Títulos (deus, caracteristica)
caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

% Fatos: Relações de Aliança (Aliança é simétrica)
aliado(zeus, poseidon).
aliado(poseidon, zeus).
aliado(atena, apolo).
aliado(apolo, atena).
aliado(ares, hades).
aliado(hades, ares).
aliado(hefesto, atena).
aliado(atena, hefesto).

% Fatos: Localização ou Assinatura
local_principal(zeus, olimpo).
local_principal(poseidon, atlântida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% Regra pedida: ancestral(A,D)
% Caso Base:
% Verdadeiro se A for progenitor de D
ancestral(A, D) :-
    progenitor(A, D).

% Passo Recursivo:
% Verdadeiro se S for progenitor de um intermediario Z e Z for ancestral de D
ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).
