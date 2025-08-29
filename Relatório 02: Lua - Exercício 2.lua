
function maiorValor(tabela)
    local maior = tabela[1] 
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

local numeros = {10, 25, 7, 99, 42, 15}

print("Os números da tabela são:")
for i, v in ipairs(numeros) do
    io.write(v .. " ")
end
print("\n")

local resultado = maiorValor(numeros)
print("O maior valor encontrado foi: " .. resultado)
