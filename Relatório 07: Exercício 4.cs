using System;


abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} se move de forma misteriosa nas sombras.");
    }
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} anda lentamente em sua direção.");
    }
}

class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} desliza rapidamente através das paredes.");
    }
}

class Program
{
    static void Main(string[] args)
    {
        MonstroSombrio[] monstros = new MonstroSombrio[]
        {
            new Zumbi("Zumbi Lerdo"),
            new Espectro("Espectro Rápido"),
            new Zumbi("Zumbi Apodrecido"),
            new Espectro("Espectro das Sombras")
        };

        foreach (MonstroSombrio m in monstros)
        {
            m.Mover();
        }
    }
}
