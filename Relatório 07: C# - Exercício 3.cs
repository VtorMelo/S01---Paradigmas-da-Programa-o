using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio
{
    private List<Feitico> feitiços;

    public Grimorio()
    {
        feitiços = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico feitico)
    {
        feitiços.Add(feitico);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("Feitiços no Grimório:");
        foreach (var f in feitiços)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

class Maga
{
    public string Nome { get; private set; }
    public Grimorio Grimorio { get; private set; } 
    public List<Ferramenta> Ferramentas { get; private set; }

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Grimorio = new Grimorio();
        Ferramentas = ferramentas;
    }

    public void MostrarFerramentas()
    {
        Console.WriteLine($"Ferramentas de {Nome}:");
        foreach (var f in Ferramentas)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Lanterna"),
            new Ferramenta("Bússola"),
            new Ferramenta("Capa de Viagem")
        };

        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Raio de Gelo"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Campo de Cura"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Barreira Mágica"));

        Console.WriteLine($"Maga: {frieren.Nome}\n");
        frieren.Grimorio.ListarFeiticos();
        Console.WriteLine();
        frieren.MostrarFerramentas();
    }
}
