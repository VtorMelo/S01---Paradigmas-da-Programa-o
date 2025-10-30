class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado.");
  }
}

class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo;
    this.gasRestante = 100;
  }

  usarGas(quantidade) {
    this.gasRestante -= quantidade;
    if (this.gasRestante < 0) this.gasRestante = 0;
  }

  getGas() {
    return this.gasRestante;
  }
}

class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.gear.usarGas(10);
    return `${this.nome} está explorando o território com ${this.gear.modelo}. Gás restante: ${this.gear.getGas()}%`;
  }

  verificarEquipamento() {
    return `Equipamento ${this.gear.modelo} com ${this.gear.getGas()}% de gás restante.`;
  }
}

class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    return this.membros.map(membro => membro.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map(membro => membro.verificarEquipamento());
  }
}

const soldado1 = new Soldado("Eren", "Modelo A");
const soldado2 = new Soldado("Mikasa", "Modelo B");
const esquadrao = new Esquadrao(soldado1, [soldado1, soldado2]);

console.log("Exploração:");
console.log(esquadrao.explorarTerritorio().join("\n"));

console.log("\nStatus:");
console.log(esquadrao.relatarStatus().join("\n"));
