class ArmaCorpoACorpo:
                def __init__(self, nome_arma: str):
                    self.nome_arma = nome_arma

                def __str__(self):
                    return f"Arma corpo a corpo: {self.nome_arma}"

class PhantomThieves:
                def __init__(self, nome: str, arma: str):
                    self.nome = nome
                    self.arma = arma

                def __str__(self):
                    return f"Membro: {self.nome} | Arma: {self.arma}"

class Joker:
                def __init__(self, arma_nome: str, equipe: list[PhantomThieves]):
                    self.arma = ArmaCorpoACorpo(arma_nome)

                    self.equipe = equipe

                def mostrar_equipe(self):
                    print(f"Joker empunha sua {self.arma.nome_arma} e lidera os Phantom Thieves")
                    print("Equipe:")
                    for membro in self.equipe:
                        print(f" - {membro.nome} com {membro.arma}")

if __name__ == "__main__":
                membro1 = PhantomThieves("Skull", "Bastão de ferro")
                membro2 = PhantomThieves("Panther", "Chicote")
                membro3 = PhantomThieves("Queen", "Soco inglês")

                equipe_joker = [membro1, membro2, membro3]

                joker = Joker("Faca de Aço", equipe_joker)

                joker.mostrar_equipe()
