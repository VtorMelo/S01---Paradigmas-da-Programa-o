function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b ~= 0 then
            return a / b
        else
            return "Erro: divisão por zero!"
        end
    else
        return "Erro: operador inválido!"
    end
end
