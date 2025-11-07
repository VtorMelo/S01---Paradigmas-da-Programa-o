import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;

class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return nome + " (dano: " + dano + ")";
    }
}

class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public String getNome() {
        return nome;
    }

    public String getIdBoss() {
        return idBoss;
    }

    public String getPontoFraco() {
        return pontoFraco;
    }

    public Set<PadraoAtaque> getMoveset() {
        return moveset;
    }

    public void iniciarFase() {
        System.out.println("=== Iniciando fase do boss: " + nome + " (ID: " + idBoss + ") ===");
        System.out.println("Ponto fraco: " + pontoFraco);
        if (moveset.isEmpty()) {
            System.out.println("Este boss não tem ataques definidos.");
        } else {
            System.out.println("Moveset (em ordem de adição):");
            int i = 1;
            for (PadraoAtaque p : moveset) {
                System.out.println(i++ + ". " + p);
            }
        }
        System.out.println("============================================\n");
    }
}

class BossMagico extends Boss {
    private int mana;

    public BossMagico(String nome, String idBoss, String pontoFraco, int manaInicial) {
        super(nome, idBoss, pontoFraco);
        this.mana = manaInicial;
    }

    public int getMana() {
        return mana;
    }

    public void setMana(int mana) {
        this.mana = mana;
    }

    @Override
    public void iniciarFase() {
        System.out.println("~~~ Boss Mágico despertando! ~~~");
        super.iniciarFase(); // mantém a listagem padrão
        System.out.println(getNome() + " tem " + mana + " de mana.");
        System.out.println(getNome() + " conjura um escudo mágico antes de atacar!\n");
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss encontrado = arena.get(idBoss);
        if (encontrado == null) {
            System.out.println("Nenhum boss encontrado com o ID: " + idBoss + "\n");
        } else {
            encontrado.iniciarFase();
        }
    }

    public void listarBosses() {
        System.out.println("Bosses na arena:");
        for (String id : arena.keySet()) {
            Boss b = arena.get(id);
            System.out.println("- ID: " + id + " | Nome: " + b.getNome());
        }
        System.out.println();
    }
}

public class Main {
    public static void main(String[] args) {
        PadraoAtaque golpe = new PadraoAtaque("Golpe Massivo", 30);
        PadraoAtaque investida = new PadraoAtaque("Investida Sombria", 20);
        PadraoAtaque meteorito = new PadraoAtaque("Queda de Meteorito", 50);
        PadraoAtaque ondaMagica = new PadraoAtaque("Onda Mágica", 25);

        Boss boss1 = new Boss("Goliath", "B001", "Cabeça (cristal)");
        boss1.adicionarAtaque(golpe);
        boss1.adicionarAtaque(investida);

        BossMagico bossMag = new BossMagico("Arcanus", "B002", "Fonte de Mana", 100);
        bossMag.adicionarAtaque(ondaMagica);
        bossMag.adicionarAtaque(meteorito);
        bossMag.adicionarAtaque(meteorito);

        Batalha arena = new Batalha();
        arena.adicionarBoss(boss1);
        arena.adicionarBoss(bossMag);

        arena.listarBosses();

        arena.iniciarBatalha("B001");
        arena.iniciarBatalha("B002");
        arena.iniciarBatalha("B999");
    }
}
