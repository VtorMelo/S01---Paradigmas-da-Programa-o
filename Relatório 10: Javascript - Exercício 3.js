class Criatura {
  constructor(nome, perigosa = false) {
    this.nome = String(nome);
    this.perigosa = Boolean(perigosa);
  }
}

class Diario {
  #autorSecreto;
  enigmas;
  criaturasAvistadas;

  constructor(autorSecreto) {
    this.#autorSecreto = String(autorSecreto);
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }
  
  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    const chaveNum = Number(num);
    if (!Number.isFinite(chaveNum)) {
      throw new TypeError("Número do enigma inválido.");
    }
    this.enigmas.set(chaveNum, String(enigma));
  }

  decodificar(chave, num) {
    if (String(chave) !== this.#autorSecreto) {
      throw new Error("Acesso negado: chave do autor inválida.");
    }

    const indice = Number(num);
    if (!Number.isFinite(indice)) {
      throw new TypeError("Índice do enigma inválido.");
    }

    if (!this.enigmas.has(indice)) {
      throw new Error(`Enigma com índice ${indice} não encontrado.`);
    }

    return this.enigmas.get(indice);
  }

  registrarCriatura(criatura) {
    if (!(criatura instanceof Criatura)) {
      throw new TypeError("Esperado um objeto Criatura.");
    }
    this.criaturasAvistadas.push(criatura);
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = String(nome);
    this.idade = Number(idade);
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade);

    if (diario && !(diario instanceof Diario)) {
      throw new TypeError("diario deve ser uma instância de Diario.");
    }
    this.diario = diario || new Diario("autorPadrao");
  }
}

class CabanaMisterio {
  constructor(diario) {
    if (diario && !(diario instanceof Diario)) {
      throw new TypeError("diario deve ser uma instância de Diario.");
    }

    this.diario = diario || new Diario("autorCabana");
    this.visitantes = [];
    this.funcionarios = [];
  }

  adicionarVisitante(nome) {
    this.visitantes.push(String(nome));
  }

  adicionarFuncionario(personagem) {
    if (!(personagem instanceof Personagem)) {
      throw new TypeError("Esperado um Personagem.");
    }
    this.funcionarios.push(personagem);
  }

  listarFuncionarios() {
    return this.funcionarios.slice();
  }
}

const diarioDipper = new Diario("DipperSecret");

diarioDipper.adicionarEnigma(1, "Enigma do lago");
diarioDipper.adicionarEnigma(2, "Enigma do homem de estanho");

diarioDipper.registrarCriatura(new Criatura("Homem-Cervídeo", true));
diarioDipper.registrarCriatura(new Criatura("Gnomos", false));

const dipper = new Protagonista("Dipper", 12, diarioDipper);

const cabana = new CabanaMisterio(diarioDipper);
const personagem1 = new Personagem("Grenda", 13);
const personagem2 = new Personagem("Soos", 24);
cabana.adicionarFuncionario(personagem1);
cabana.adicionarFuncionario(personagem2);

console.log("Autor do diário (privado):", diarioDipper.getAutor());
console.log("Decodificando enigma 1 com chave correta:");
console.log(diarioDipper.decodificar("DipperSecret", 1));

console.log("\nCriaturas avistadas no diário:");
diarioDipper.criaturasAvistadas.forEach((c, i) =>
  console.log(i + 1, "-", c.nome, "(perigosa:", c.perigosa + ")")
);

console.log("\nFuncionários agregados à Cabana:");
cabana.listarFuncionarios().forEach((f) =>
  console.log("-", f.nome, "(idade:", f.idade + ")")
);
