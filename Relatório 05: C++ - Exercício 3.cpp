#include <iostream>
using namespace std;

int main() {
    int quantidade;
    cout << "Digite quantas notas deseja inserir: ";
    cin >> quantidade;

    float nota, soma = 0;

    for (int i = 0; i < quantidade; i++)
      {
        cout << "Digite a nota = ";
        cin >> nota;
      
        while (nota < 0 || nota > 10) 
        {
            cout << "Nota invalida, digite novamente: ";
            cin >> nota;
        }

        soma += nota;
    }

    float media = soma / quantidade;

    cout << "Media final = " << media << endl;

    if (media >= 7) 
    {
        cout << "Aprovado!" << endl;
    } else 
    {
        cout << "Reprovado!" << endl;
    }

    return 0;
}
