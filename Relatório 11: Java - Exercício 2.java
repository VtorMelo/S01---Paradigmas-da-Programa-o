import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }

    @Override
    public String toString() {
        return nome + " (R$ " + String.format("%.2f", calcularPrecoFinal()) + ")";
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPrecoBase() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu() {
        this.itens = new ArrayList<>();
    }

    public Menu(ArrayList<Cafe> itens) {
        this.itens = new ArrayList<>(itens);
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void listarItens() {
        System.out.println("Menu:");
        for (int i = 0; i < itens.size(); i++) {
            System.out.println((i + 1) + ". " + itens.get(i));
        }
    }
}

class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome());
        System.out.println("Preço final: R$ " + String.format("%.2f", cafe.calcularPrecoFinal()));
    }
}

public class Main {
    public static void main(String[] args) {
        Cafe espresso = new Cafe("Espresso", 4.50);
        CafeGourmet mochaGourmet = new CafeGourmet("Mocha Gourmet", 7.00, 2.50);
        Cafe capuccino = new Cafe("Capuccino", 6.00);
      
        Menu menu = new Menu();
        menu.adicionarItem(espresso);
        menu.adicionarItem(mochaGourmet);
        menu.adicionarItem(capuccino);

        CafeLeblanc leblanc = new CafeLeblanc(menu);

        leblanc.getMenu().listarItens();

        System.out.println();

        leblanc.receberPedido(espresso);
        System.out.println();
        leblanc.receberPedido(mochaGourmet);
    }
}
