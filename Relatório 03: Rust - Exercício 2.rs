use std::io;

fn eh_par(numero: i32) -> bool 
  {
    numero % 2 == 0
}

fn main() {
   
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Falha ao ler a entrada");
    let escolha = escolha.trim().to_lowercase(); 

    println!("Jogador 1, digite seu número (inteiro):");
    let mut entrada1 = String::new();
    io::stdin()
        .read_line(&mut entrada1)
        .expect("Falha ao ler o número");
    let numero1: i32 = entrada1.trim().parse().expect("Digite um número válido!");

    
    println!("Jogador 2, digite seu número (inteiro):");
    let mut entrada2 = String::new();
    io::stdin()
        .read_line(&mut entrada2)
        .expect("Falha ao ler o número");
    let numero2: i32 = entrada2.trim().parse().expect("Digite um número válido!");

    let soma = numero1 + numero2;
    println!("A soma dos números é: {}", soma);

    let soma_par = eh_par(soma);

    if (soma_par && escolha == "par") || (!soma_par && escolha == "ímpar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
