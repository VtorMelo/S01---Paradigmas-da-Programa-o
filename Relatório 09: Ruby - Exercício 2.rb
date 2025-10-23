class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "Este método é implementado pelas subclasses"
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' em seu piano."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' em seu violino."
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\n🎶 Iniciando ensaio da peça '#{peca}'...\n\n"
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    puts "\n🧠 Mudando foco dos músicos para: #{estado}\n\n"
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
    mensagens.each { |msg| puts msg }
  end
end

puts "=== Maestro AfterLife ==="
puts "Digite o nome da peça a ser tocada:"
peca = gets.chomp

musicos = [
  Pianista.new("Kousei"),
  Violinista.new("Kaori")
]

maestro = Maestro.new(musicos)

maestro.mudar_foco("Concentrado")
maestro.iniciar_ensaio(peca)
