using System;
using System.Collections.Generic;

class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} realiza um ataque genérico!");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança uma poderosa rajada de fogo!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de água!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Pokemon> pokemons = new List<Pokemon>();

        Pokemon charizard = new PokemonDeFogo("Charizard");
        Pokemon blastoise = new PokemonDeAgua("Blastoise");

        pokemons.Add(charizard);
        pokemons.Add(blastoise);

        foreach (Pokemon p in pokemons)
        {
            p.Atacar();
        }
    }
}
