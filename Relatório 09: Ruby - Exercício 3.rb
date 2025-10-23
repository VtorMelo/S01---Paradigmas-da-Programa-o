    class MicroondasUnidade
      def aquecer_por(segundos)
        puts "🔆 Aquecendo por #{segundos} segundos..."
      end
    end

    class DMail
      attr_reader :conteudo, :hora_envio

      def initialize(conteudo, hora_envio)
        @conteudo = conteudo
        @hora_envio = hora_envio
      end

      def to_s
        "D-Mail enviado às #{@hora_envio} com conteúdo: '#{@conteudo}'"
      end
    end

    class TelefoneDeMicroondas
      def initialize
        @unidade = MicroondasUnidade.new
        @d_mails = []
      end

      def enviar_dmail
        print "Digite o conteúdo do D-Mail: "
        conteudo = gets.chomp

        print "Digite a hora de envio (ex: 10:30): "
        hora = gets.chomp

        @unidade.aquecer_por(5)

        dmail = DMail.new(conteudo, hora)
        @d_mails << dmail
        puts "\n✅ D-Mail enviado com sucesso!"
      end

      def listar_dmails(horario_corte)
        puts "\n📨 Listando D-Mails enviados após #{horario_corte}:"
        recentes = @d_mails.select { |d| d.hora_envio > horario_corte }
        if recentes.empty?
          puts "Nenhum D-Mail encontrado após esse horário."
        else
          recentes.each { |d| puts d.to_s }
        end
      end
    end

    telefone = TelefoneDeMicroondas.new

    loop do
      puts "\n=== Menu Telefone de Microondas ==="
      puts "1. Enviar D-Mail"
      puts "2. Listar D-Mails após um horário"
      puts "3. Sair"
      print "Escolha uma opção: "
      opcao = gets.chomp.to_i

      case opcao
      when 1
        telefone.enviar_dmail
      when 2
        print "Digite o horário de corte (ex: 09:00): "
        horario = gets.chomp
        telefone.listar_dmails(horario)
      when 3
        puts "Encerrando o programa..."
        break
      else
        puts "Opção inválida!"
      end
    end
