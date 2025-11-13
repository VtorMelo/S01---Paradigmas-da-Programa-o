data Servico = Servico
  { nomeServico :: String
  , tipoServico :: String
  , precoBase   :: Double
  } deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
  deriving (Show, Eq)

data Atendimento = Atendimento
  { servicos :: [Servico]
  , statusAt :: StatusAtendimento
  } deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss =
  let t0 = sum (map precoBase ss)
      t1 = if length ss > 3 then t0 * 1.25 else t0
      t2 = if t1 > 500 then t1 * 0.90 else t1
  in t2

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0.0
valorFinalAtendimento (Atendimento ss _) =
  bonusEspiritual ss

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço registrado"
descricaoPrimeiroServico (Atendimento (s:_) _) =
  nomeServico s ++ " - " ++ tipoServico s

banho :: Servico
banho = Servico "Banho Relaxante" "Banho" 120.0

massagem :: Servico
massagem = Servico "Massagem Energética" "Massagem" 200.0

banquete :: Servico
banquete = Servico "Banquete Espiritual" "Banquete" 250.0

ritual :: Servico
ritual = Servico "Ritual da Fortuna" "Ritual" 180.0

limpeza :: Servico
limpeza = Servico "Limpeza Profunda" "Limpeza" 90.0

atendimento1 :: Atendimento
atendimento1 = Atendimento [banho, massagem] EmAndamento

atendimento2 :: Atendimento
atendimento2 = Atendimento [banho, massagem, banquete, ritual] Finalizado

atendimento3 :: Atendimento
atendimento3 = Atendimento [limpeza] Cancelado

atendimento4 :: Atendimento
atendimento4 = Atendimento [banquete, banquete, banquete, banquete] Finalizado

resumoAtendimento :: String -> Atendimento -> IO ()
resumoAtendimento titulo a = do
  putStrLn $ "=== " ++ titulo ++ " ==="
  putStrLn $ "Status: " ++ show (statusAt a)
  putStrLn $ "Primeiro serviço: " ++ descricaoPrimeiroServico a
  putStrLn $ "Serviços: " ++ show (map nomeServico (servicos a))
  putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento a)
  putStrLn ""

main :: IO ()
main = do
  resumoAtendimento "Atendimento 1 (Em Andamento)" atendimento1
  resumoAtendimento "Atendimento 2 (Finalizado)" atendimento2
  resumoAtendimento "Atendimento 3 (Cancelado)" atendimento3
  resumoAtendimento "Atendimento 4 (Finalizado - muitos banquetes)" atendimento4
