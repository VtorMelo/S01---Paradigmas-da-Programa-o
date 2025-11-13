data Item = Item
  { nome     :: String
  , categoria :: String
  , preco    :: Double
  } deriving (Show)

data CompraZelda = CompraZelda
  { itens :: [Item]
  } deriving (Show)

totalItens :: [Item] -> Double
totalItens xs = sum (map preco xs)

calculaDesconto :: [Item] -> Double
calculaDesconto xs
  | t > 200  = t * 0.10
  | otherwise = 0
  where
    t = totalItens xs

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda xs)
  | t > 200  = t - desconto
  | otherwise = t + frete
  where
    t = totalItens xs
    desconto = calculaDesconto xs
    frete = 15.0

printItem :: Item -> IO ()
printItem (Item n c p) =
  putStrLn $ "- " ++ n ++ " (" ++ c ++ "): R$ " ++ show p

espada :: Item
espada = Item "Espada de Hylia" "Arma" 150.0

arco :: Item
arco = Item "Arco de Faísca" "Arma" 80.0

poçao :: Item
poçao = Item "Poção Vida" "Poção" 30.0

escudo :: Item
escudo = Item "Escudo Antigo" "Equipamento" 90.0

compra1 :: CompraZelda
compra1 = CompraZelda [espada, arco]

compra2 :: CompraZelda
compra2 = CompraZelda [poçao, escudo]

compra3 :: CompraZelda
compra3 = CompraZelda [espada, poçao]

main :: IO ()
main = do
  putStrLn "=== Compra 1 ==="
  mapM_ printItem (itens compra1)
  putStrLn $ "Total bruto: R$ " ++ show (totalItens (itens compra1))
  putStrLn $ "Desconto: R$ " ++ show (calculaDesconto (itens compra1))
  putStrLn $ "Valor final: R$ " ++ show (valorFinal compra1)
  putStrLn ""

  putStrLn "=== Compra 2 ==="
  mapM_ printItem (itens compra2)
  putStrLn $ "Total bruto: R$ " ++ show (totalItens (itens compra2))
  putStrLn $ "Desconto: R$ " ++ show (calculaDesconto (itens compra2))
  putStrLn $ "Valor final: R$ " ++ show (valorFinal compra2)
  putStrLn ""

  putStrLn "=== Compra 3 ==="
  mapM_ printItem (itens compra3)
  putStrLn $ "Total bruto: R$ " ++ show (totalItens (itens compra3))
  putStrLn $ "Desconto: R$ " ++ show (calculaDesconto (itens compra3))
  putStrLn $ "Valor final: R$ " ++ show (valorFinal compra3)
