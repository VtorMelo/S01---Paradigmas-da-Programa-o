use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) 
  {
    for i in limite_inferior..=limite_superior
      {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
   
    println!("Digite o número da tabuada:");
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Falha ao ler entrada");
    let numero: i32 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite o limite inferior:");
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Falha ao ler entrada");
    let limite_inferior: i32 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite o limite superior:");
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Falha ao ler entrada");
    let limite_superior: i32 = entrada.trim().parse().expect("Digite um número válido");

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
