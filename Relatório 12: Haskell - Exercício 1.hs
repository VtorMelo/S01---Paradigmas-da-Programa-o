data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show)

data Status = Aberto | Entregue | Cancelado
  deriving (Show, Eq)

data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: Status
  } deriving (Show)
valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido lista _) =
  sum (map preco lista) + 5

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)      = "Nenhuma bebida no pedido"
primeiraBebida (Pedido (b:_) _)   = nome b

cafe :: Bebida
cafe = Bebida "Latte" "Café" 7.50

cha :: Bebida
cha = Bebida "Chá Verde" "Chá" 5.00

suco :: Bebida
suco = Bebida "Suco de Laranja" "Suco" 6.00

pedido1 :: Pedido
pedido1 = Pedido [cafe, cha] Aberto

pedido2 :: Pedido
pedido2 = Pedido [suco] Cancelado

pedido3 :: Pedido
pedido3 = Pedido [] Aberto

main :: IO ()
main = do
  putStrLn ("Primeira bebida do pedido 1: " ++ primeiraBebida pedido1)
  putStrLn ("Valor total do pedido 1: " ++ show (valorTotalPedido pedido1))

  putStrLn ("Primeira bebida do pedido 2: " ++ primeiraBebida pedido2)
  putStrLn ("Valor total do pedido 2: " ++ show (valorTotalPedido pedido2))

  putStrLn ("Primeira bebida do pedido 3: " ++ primeiraBebida pedido3)
  putStrLn ("Valor total do pedido 3: " ++ show (valorTotalPedido pedido3))
