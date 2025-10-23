module Rastreavel
  def obter_localizacao(hora)
    puts "#{@nome} foi rastreado às #{hora} na localização: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    puts " #{@nome} apresenta risco elevado! Mantenha distância!"
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end

  def to_s
    "#{@nome} localizado em #{@localizacao}"
  end
end

class Detetive < Participante
  include Rastreavel

  def obter_localizacao(hora)
    puts "Detetive #{@nome} investigando em #{@localizacao} às #{hora}."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def obter_localizacao(hora)
    puts "Criminoso #{@nome} foi avistado em #{@localizacao} às #{hora}."
  end

  def calcular_risco
    puts "#{@nome} representa perigo extremo para civis e detetives!"
  end
end

class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(p)
    @participantes << p
  end

  def identificar_ameacas
    puts "\n Identificando Ameaças"
    ameacas = @participantes.select { |p| p.respond_to?(:calcular_risco) }
    ameacas.each(&:calcular_risco)
  end
end

puts " O Jogo das Sombras"

print "Digite a localização atual de Sherlock (Detetive): "
local_sherlock = gets.chomp
sherlock = Detetive.new("Sherlock Holmes", local_sherlock)

print "Digite a localização atual de Moriarty (Mestre do Crime): "
local_moriarty = gets.chomp
moriarty = MestreDoCrime.new("Professor Moriarty", local_moriarty)

cenario = Cenario.new
cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

puts "\nDigite o horário atual (ex: 22:45):"
hora = gets.chomp

puts "\n Rastreamento de Participantes"
sherlock.obter_localizacao(hora)
moriarty.obter_localizacao(hora)

cenario.identificar_ameacas
