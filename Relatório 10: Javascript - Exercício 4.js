class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("Método rastrearLocal() deve ser implementado!");
  }
}

class Hunter extends IRastreavel {
  constructor(nome, localizacao, idade) {
    super();
    this.nome = nome;
    this.localizacao = localizacao;
    this.idade = idade;
  }

  rastrearLocal(latitude, longitude) {
    throw new Error("Subclasses devem implementar rastrearLocal()");
  }
}

class Especialista extends Hunter {
  constructor(nome, localizacao, idade, habilidadeNen) {
    super(nome, localizacao, idade);
    this.habilidadeNen = habilidadeNen;
  }

  rastrearLocal(latitude, longitude) {
    this.localizacao = `${latitude}, ${longitude}`;
    return `Especialista ${this.nome} usou ${this.habilidadeNen} e rastreou o local: ${this.localizacao}`;
  }
}

class Manipulador extends Hunter {
  constructor(nome, localizacao, idade, alvoAtual) {
    super(nome, localizacao, idade);
    this.alvoAtual = alvoAtual;
  }

  rastrearLocal(latitude, longitude) {
    this.localizacao = `${latitude}, ${longitude}`;
    return `Manipulador ${this.nome} está rastreando ${this.alvoAtual?.nome || "alvo desconhecido"} em ${this.localizacao}`;
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set();
  }

  adicionarHunter(hunter) {
    for (let h of this.hunters) {
      if (h.nome === hunter.nome) {
        console.log(`Hunter ${hunter.nome} já está no batalhão.`);
        return;
      }
    }
    this.hunters.add(hunter);
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(latitude, longitude) {
    let resultados = [];
    for (let hunter of this.hunters) {
      resultados.push(hunter.rastrearLocal(latitude, longitude));
    }
    return resultados;
  }
}

const gon = new Especialista("Gon", "Montanhas", 14, "Jajanken");
const hisoka = new Manipulador("Hisoka", "Cidade", 28, gon);

const b = new Batalhao();
b.adicionarHunter(gon);
b.adicionarHunter(hisoka);
b.adicionarHunter(gon); // duplicado, não irá entrar no batalhão

console.log("Número de Hunters:", b.getNumHunters());
console.log("Rastreamento iniciado:");
console.log(b.iniciarRastreamento("45°S", "60°W"));
