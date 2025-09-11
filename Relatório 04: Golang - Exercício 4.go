package main

import "fmt"

func VerificarLogin(usuario, senha string) bool {
    if usuario == "senha" && senha == "admin" {
        return true
    }
    return false
}

func main(){
  var usuario, senha string

  for{
    fmt.Println("Digite o usuario:")
    fmt.Scan(&usuario)
    fmt.Println("Digite a senha:")
    fmt.Scan(&senha)
    if VerificarLogin(usuario, senha) {
      fmt.Println("Login realizado com sucesso!")
      break
    } else {
      fmt.Println("Usuario ou senha incorretos, tente novamente.")
    }
  }
}
