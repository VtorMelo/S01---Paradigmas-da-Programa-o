class Pokemon {
  #vida;
  
  nome;
  tipo;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = Number(vidaInicial) || 0;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    const danoNumerico = Number(dano) || 0;
    if (danoNumerico <= 0) return;

    this.#vida = Math.max(0, this.#vida - danoNumerico);

    console.log(
      `${this.nome} recebeu ${danoNumerico} de dano. Vida agora: ${this.#vida}`
    );
  }

  atacar(alvo) {
    if (!(alvo instanceof Pokemon)) {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }

    const danoBase = 10;
    console.log(`${this.nome} usa ataque genérico contra ${alvo.nome}!`);
    alvo.receberDano(danoBase);
  }
}

class PokemonFogo extends Pokemon {
  bonusAtaque;

  constructor(nome, vidaInicial, bonusAtaque = 0) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = Number(bonusAtaque) || 0;
  }

  atacar(alvo) {
    if (!(alvo instanceof Pokemon)) {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }

    const dano = 12 + this.bonusAtaque;
    console.log(
      `${this.nome} (Fogo) incinera ${alvo.nome} causando ${dano} de dano!`
    );
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase = 0) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = Number(curaBase) || 0;
  }

  // método privado auxiliar para curar
  #curar(quantia) {
    const q = Math.max(0, Number(quantia) || 0);

    this.receberCura(q);
  }

  atacar(alvo)
  {
    if (!(alvo instanceof Pokemon))
    {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }

    const dano = 8;
    console.log(
      `${this.nome} (Água) ataca ${alvo.nome}, causa ${dano} de dano e tenta se recuperar ${this.#curaBase} pontos!`
    );

    alvo.receberDano(dano);
    this.#curar(this.#curaBase);
  }

  receberCura(quantia) {
    const q = Math.max(0, Number(quantia) || 0);
    console.log(`${this.nome} recupera ${q} pontos de vida.`);
  }
}

class PokemonComCura extends Pokemon {
  constructor(nome, tipo, vidaInicial) {
    super(nome, tipo, vidaInicial);
  }

  receberCura(quantia) {
    const q = Math.max(0, Number(quantia) || 0);
    if (q === 0) return;

    console.log(`${this.nome} recupera ${q} pontos (método base).`);
  }
}


class PokemonFinal {
  #vida;
  nome;
  tipo;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = Number(vidaInicial) || 0;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    const danoNum = Math.max(0, Number(dano) || 0);
    if (danoNum === 0) return;
    this.#vida = Math.max(0, this.#vida - danoNum);
    console.log(`${this.nome} recebeu ${danoNum} de dano. Vida: ${this.#vida}`);
  }

  receberCura(quantia) {
    const q = Math.max(0, Number(quantia) || 0);
    if (q === 0) return;
    this.#vida = this.#vida + q;
    console.log(`${this.nome} foi curado em ${q}. Vida: ${this.#vida}`);
  }

  atacar(alvo) {
    if (!(alvo instanceof PokemonFinal)) {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }
    const danoBase = 10;
    console.log(`${this.nome} usa ataque genérico contra ${alvo.nome} (${danoBase} dano).`);
    alvo.receberDano(danoBase);
  }
}

class PokemonFogoFinal extends PokemonFinal {
  bonusAtaque;

  constructor(nome, vidaInicial, bonusAtaque = 0) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = Number(bonusAtaque) || 0;
  }

  atacar(alvo) {
    if (!(alvo instanceof PokemonFinal)) {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }
    const dano = 12 + this.bonusAtaque;
    console.log(`${this.nome} (Fogo) lança uma bola de fogo em ${alvo.nome} (${dano} dano)!`);
    alvo.receberDano(dano);
  }
}

class PokemonAguaFinal extends PokemonFinal {
  #curaBase;

  constructor(nome, vidaInicial, curaBase = 0) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = Number(curaBase) || 0;
  }

  atacar(alvo) {
    if (!(alvo instanceof PokemonFinal)) {
      console.log("Alvo inválido — precisa ser um Pokemon.");
      return;
    }
    const dano = 8;
    console.log(`${this.nome} (Água) acerta ${alvo.nome} e tenta se recuperar (${this.#curaBase} cura).`);
    alvo.receberDano(dano);
    this.receberCura(this.#curaBase);
  }
}

const charmander = new PokemonFogoFinal("Charmander", 40, 5);
const squirtle = new PokemonAguaFinal("Squirtle", 50, 6);
const pidgey = new PokemonFinal("Pidgey", "Normal", 30);

const pokemons = [charmander, squirtle, pidgey];

console.log("\n   Batalha Exemplo");

for (let i = 0; i < pokemons.length; i++) {
  const atacante = pokemons[i];
  const alvo = pokemons[(i + 1) % pokemons.length];
  atacante.atacar(alvo);
}

console.log("\n  Vidas Finais");
for (const p of pokemons) {
  console.log(`${p.nome} (${p.tipo}): ${p.getVida()} HP`);
}
