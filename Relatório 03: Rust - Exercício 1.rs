use std::io;

fn verificar_senha(senha: &str) -> bool 
  {
    if senha.len() < 8 
    {
        return false;
    }

    let mut tem_numero = false;
    let mut tem_maiuscula = false;

    for c in senha.chars() 
      {
        if c.is_ascii_digit() 
        {
            tem_numero = true;
        }
        if c.is_ascii_uppercase()
        {
            tem_maiuscula = true;
        }
    }

    tem_numero && tem_maiuscula
}

fn main() {
    loop 
      {
        println!("Digite uma senha:");

        let mut senha = String::new();
        io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler a entrada");

        let senha = senha.trim();

        if verificar_senha(senha) 
        {
            println!("Senha válida! Acesso concedido.");
            break;
        } else 
        {
            println!("Senha inválida! Tente novamente.");
        }
    }
}
