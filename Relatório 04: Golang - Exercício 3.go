package main

import "fmt"

func fibonacci(n int) {
  a, b := 0, 1
  for i := 0; i < n; i++ {
    fmt.Println(a, " ")
    a, b = b, a+b
  }
  fmt.Println()
}

func main(){
  var n int
  fmt.Println("Digite quantos números da sequência: ")
  fmt.Scan(&n)
  fibonacci(n)
}
