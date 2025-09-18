#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho)
{
    float soma = 0;
    for (int i = 0; i < tamanho; i++) 
    {
        soma += arr[i];
    }
    return soma;
}

int main() 
{
    int tamanho;
    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho];

    cout << "Digite os " << tamanho << " valores do array:" << endl;
  
    for (int i = 0; i < tamanho; i++) 
    {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << "A soma dos valores do array é igual a = " << resultado << endl;

    return 0;
}
