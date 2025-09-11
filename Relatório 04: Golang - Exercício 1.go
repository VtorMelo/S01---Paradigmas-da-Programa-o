package main

import "fmt"

func classificar_num(num int) string {

if num > 0 {
	return "positivo"
} else if num < 0 {
	return "negativo"
}	else if num == 0 {
	return "zero"
	}
	return ""
}
func main() {

	var num int
	fmt.Println("Digite um número:")
	fmt.Scan(&num)
	resultado := classificar_num(num)
	fmt.Println("O número é", resultado)
}
