from abc import ABC, abstractmethod

class Cibernetico(ABC):
            @abstractmethod
            def realizar_hack(self):
                pass

class Implante:
            def __init__(self, custo, funcao):
                self.custo = custo
                self.funcao = funcao

class NetRunner(Cibernetico):
            def __init__(self, nome, custo_implante, funcao_implante):
                self.nome = nome
                self.implante = Implante(custo_implante, funcao_implante)

            def realizar_hack(self):
                print(f"{self.nome} está hackeando com {self.implante.funcao} (custo: {self.implante.custo})")

class Faccao:
            def __init__(self, nome, membros=None):
                self.nome = nome
                self.membros = membros if membros else []

            def adicionar_membro(self, membro):
                self.membros.append(membro)

            def realizar_hack_em_grupo(self):
                print(f"\n[Facção: {self.nome}] Iniciando ataque coordenado...\n")
                for membro in self.membros:
                    membro.realizar_hack()

if __name__ == "__main__":
            n1 = NetRunner("V", 5000, "Implante Neural Avançado")
            n2 = NetRunner("Lucy", 7000, "Link de Dados Ultra-rápido")
            n3 = NetRunner("David", 6500, "Potenciador de Reflexos")

            faccao = Faccao("Edgerunners")
            faccao.adicionar_membro(n1)
            faccao.adicionar_membro(n2)
            faccao.adicionar_membro(n3)

            faccao.realizar_hack_em_grupo()
