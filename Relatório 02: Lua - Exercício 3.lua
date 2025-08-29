function filtrarPares(tabela)
    local pares = {} 
    for i = 1, #tabela do
        if tabela[i] % 2 == 0 then
            table.insert(pares, tabela[i])
        end
    end
    return pares
end

local numeros = {10, 15, 22, 33, 40, 51, 62, 73, 80}

print("Tabela original:")
for i, v in ipairs(numeros) do
    io.write(v .. " ")
end
print("\n")

local somentePares = filtrarPares(numeros)

print("Nova tabela (apenas números pares):")
for i, v in ipairs(somentePares) do
    io.write(v .. " ")
end
print()
