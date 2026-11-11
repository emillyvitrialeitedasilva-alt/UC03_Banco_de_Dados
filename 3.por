programa {  
  inclua biblioteca Objetos
  funcao inicio() {
    inteiro estoque[5]
        cadeia nome_busca
        logico encontrado = falso

        estoque[0] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(estoque[0], "nome", "Camisa")
        Objetos.atribuir_propriedade(estoque[0], "preco", 49.90)
        Objetos.atribuir_propriedade(estoque[0], "quantidade", 10)

        estoque[1] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(estoque[1], "nome", "Calca")
        Objetos.atribuir_propriedade(estoque[1], "preco", 119.90)
        Objetos.atribuir_propriedade(estoque[1], "quantidade", 5)

        estoque[2] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(estoque[2], "nome", "Bermuda")
        Objetos.atribuir_propriedade(estoque[2], "preco", 69.90)
        Objetos.atribuir_propriedade(estoque[2], "quantidade", 8)

        estoque[3] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(estoque[3], "nome", "Vestido")
        Objetos.atribuir_propriedade(estoque[3], "preco", 139.90)
        Objetos.atribuir_propriedade(estoque[3], "quantidade", 4)

        estoque[4] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(estoque[4], "nome", "Jaqueta")
        Objetos.atribuir_propriedade(estoque[4], "preco", 229.90)
        Objetos.atribuir_propriedade(estoque[4], "quantidade", 3)

        escreva("Digite o nome do produto que deseja buscar no estoque: ")
        leia(nome_busca)

        para (inteiro i = 0; i < 5; i++) {
            cadeia nome_atual = Objetos.obter_propriedade_tipo_cadeia(estoque[i], "nome")
            
            se (nome_atual == nome_busca) {
                escreva("\nProduto encontrado!\n")
                escreva("Preço: R$ ", Objetos.obter_propriedade_tipo_real(estoque[i], "preco"), "\n")
                escreva("Quantidade em estoque: ", Objetos.obter_propriedade_tipo_inteiro(estoque[i], "quantidade"), "\n")
                encontrado = verdadeiro
                pare
            }
        }

        se (nao encontrado) {
            escreva("\nAviso: O produto informado não existe no estoque.\n")
        }
    }
    
  }

