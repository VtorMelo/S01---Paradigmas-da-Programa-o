use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 
  {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;

    (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / (peso1 + peso2 + peso3)
}

fn main() 
  {
   
    println!("Digite a primeira nota:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let nota1: f64 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite a segunda nota:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let nota2: f64 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite a terceira nota:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let nota3: f64 = entrada.trim().parse().expect("Digite um número válido");

    let media = calcular_media(nota1, nota2, nota3);
    println!("Média: ", media);


    if media >= 7.0 
    {
        println!("Aprovado");
    } else
    {
        println!("Reprovado");
    }
}
