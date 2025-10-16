from abc import ABC, abstractmethod

class Heroi(ABC):
        def __init__(self, nome: str, funcao: str):
            self.nome = nome
            self.funcao = funcao

        @abstractmethod
        def usar_ultimate(self):
            pass

class Tanque(Heroi):
        def __init__(self, nome: str):
            super().__init__(nome, "Tanque")

        def usar_ultimate(self):
            print(f"{self.nome} ativa sua ultimate: cria um escudo impenetrável")

class Dano(Heroi):
        def __init__(self, nome: str):
            super().__init__(nome, "Dano")

        def usar_ultimate(self):
            print(f"{self.nome} ativa sua ultimate: seus disparos são teleguiados")

class Suporte(Heroi):
        def __init__(self, nome: str):
            super().__init__(nome, "Suporte")

        def usar_ultimate(self):
            print(f"{self.nome} ativa sua ultimate: revive todos os aliados no campo de batalha")

if __name__ == "__main__":
        herois = [
            Tanque("Reinhardt"),
            Dano("Soldado 76"),
            Suporte("Mercy")
        ]

        for heroi in herois:
            heroi.usar_ultimate()
