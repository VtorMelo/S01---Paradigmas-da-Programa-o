package main

import "fmt"

func main(){
var num int
fmt.Println("Digite um número: ")
fmt.Scan(&num)

resultado := num % 2
	switch resultado{
		case 0:
		fmt.Println("O número é par")
		case 1:
		fmt.Println("O número é ímpar")
		default:
	}
}
