import java.util.HashMap;
import java.util.Map;

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public String toString() {
        return nome;
    }
}

class Entidade implements IRastreavel {
    private String nome;
    private String localizacao;

    public Entidade(String nome, String localizacao) {
        this.nome = nome;
        this.localizacao = localizacao;
    }

    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String novaLocalizacao) {
        this.localizacao = novaLocalizacao;
    }

    @Override
    public String obterCoordenadas() {
        return nome + " @ " + localizacao;
    }

    @Override
    public String toString() {
        return "Entidade{" +
                "nome='" + nome + '\'' +
                ", localizacao='" + localizacao + '\'' +
                '}';
    }
}

class Youkai extends Entidade {
    private Poder poder;

    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao);
        this.poder = poder;
    }

    public Poder getPoder() {
        return poder;
    }

    public void setPoder(Poder poder) {
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return super.obterCoordenadas() + " (poder: " + poder + ")";
    }
}

class Alien extends Entidade {
    private String planetaOrigem;
    private String ovni;
    private Poder poder;

    public Alien(String nome, String localizacao, String planetaOrigem, String ovni, Poder poder) {
        super(nome, localizacao);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
        this.poder = poder;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    public Poder getPoder() {
        return poder;
    }

    @Override
    public String obterCoordenadas() {
        return super.obterCoordenadas() + " (planeta: " + planetaOrigem + ", ovni: " + ovni + ", poder: " + poder + ")";
    }
}

class RegistrosOcultos {
    private String nomeEquipe;
    private HashMap<String, Entidade> avistamentos;

    public RegistrosOcultos(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }
  
    public boolean registrarAvistamento(Entidade entidade) {
        String chave = entidade.getNome();
        if (avistamentos.containsKey(chave)) {
            return false;
        } else {
            avistamentos.put(chave, entidade);
            return true;
        }
    }

    public Entidade recuperarPorNome(String nome) {
        return avistamentos.get(nome);
    }

    public void listarAvistamentos() {
        System.out.println("Avistamentos da equipe \"" + nomeEquipe + "\":");
        for (Map.Entry<String, Entidade> e : avistamentos.entrySet()) {
            System.out.println("- " + e.getKey() + " -> " + e.getValue().obterCoordenadas());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Poder fogo = new Poder("Fogo Etéreo");
        Poder telepatia = new Poder("Telepatia");

        Alien zargon = new Alien("Zargon", "Floresta Amazônica", "Zeta Prime", "OVNI-42", fogo);
        Youkai kappa = new Youkai("Kappa", "Templo Abandonado", telepatia);

        RegistrosOcultos registros = new RegistrosOcultos("Detetives Ocultos");

        boolean r1 = registros.registrarAvistamento(zargon);
        boolean r2 = registros.registrarAvistamento(kappa);
        boolean r3 = registros.registrarAvistamento(zargon);

        System.out.println("Primeiro registro de Zargon adicionado? " + r1);
        System.out.println("Registro de Kappa adicionado? " + r2);
        System.out.println("Tentativa de registrar Zargon novamente adicionou? " + r3);
        System.out.println();

        registros.listarAvistamentos();

        Entidade recuperada = registros.recuperarPorNome("Zargon");
        if (recuperada != null) {
            System.out.println("\nRecuperado: " + recuperada.obterCoordenadas());
        }
    }
}
