{-# LANGUAGE OverloadedStrings #-}

import Text.Printf (printf)

data Banda = Banda
  { nomeBanda :: String
  , genero    :: String
  , cache     :: Double
  } deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
  deriving (Show, Eq)

data Evento = Evento
  { bandas :: [Banda]
  , statusEvento :: StatusEvento
  } deriving (Show)

totalCaches :: Evento -> Double
totalCaches (Evento bs _) = sum (map cache bs)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento ev@(Evento _ _) =
  let t = totalCaches ev
  in t * 1.2

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _)    = "Nenhuma banda para abrir"
bandaAbertura (Evento (b:_) _) = nomeBanda b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda para encerrar"
bandaEncerramento (Evento bs _) = nomeBanda (last bs)

b1 :: Banda
b1 = Banda "Metallica" "Metal" 5000.0

b2 :: Banda
b2 = Banda "Van Halen" "Rock" 3000.0

b3 :: Banda
b3 = Banda "Motley Crue" "Metal" 1500.0

b4 :: Banda
b4 = Banda "Def Leppard" "Rock" 2000.0

eventoAtivo :: Evento
eventoAtivo = Evento [b1, b3, b4] Ativo

eventoEncerrado :: Evento
eventoEncerrado = Evento [b2, b4] Encerrado

eventoCancelado :: Evento
eventoCancelado = Evento [b1, b2, b3] Cancelado

imprimeResumoEvento :: String -> Evento -> IO ()
imprimeResumoEvento titulo ev = do
  putStrLn $ "=== " ++ titulo ++ " ==="
  putStrLn $ "Status: " ++ show (statusEvento ev)
  putStrLn $ "Banda de abertura: " ++ bandaAbertura ev
  putStrLn $ "Banda de encerramento: " ++ bandaEncerramento ev
  putStrLn $ "Total dos cachês: R$ " ++ printf "%.2f" (totalCaches ev)
  putStrLn $ "Custo total (com taxa de produção quando aplicável): R$ " ++ printf "%.2f" (custoTotalEvento ev)
  putStrLn ""

main :: IO ()
main = do
  imprimeResumoEvento "Evento Ativo" eventoAtivo
  imprimeResumoEvento "Evento Encerrado" eventoEncerrado
  imprimeResumoEvento "Evento Cancelado" eventoCancelado
