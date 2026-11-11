programa {
  inclua biblioteca Objetos
  funcao inicio() {
    inteiro produto
        cadeia nome_prod
        real preco_prod
        inteiro qtd_prod

        produto = Objetos.criar_objeto()

        escreva("Digite o nome do produto: ")
        leia(nome_prod)
        
        escreva("Digite o preço do produto: ")
        leia(preco_prod)
        
        escreva("Digite a quantidade em estoque: ")
        leia(qtd_prod)

        Objetos.atribuir_propriedade(produto, "nome", nome_prod)
        Objetos.atribuir_propriedade(produto, "preco", preco_prod)
        Objetos.atribuir_propriedade(produto, "quantidade", qtd_prod)

        escreva("\n--- FICHA DO PRODUTO ---\n")
        escreva("Nome: ", Objetos.obter_propriedade_tipo_cadeia(produto, "nome"), "\n")
        escreva("Preço: R$ ", Objetos.obter_propriedade_tipo_real(produto, "preco"), "\n")
        escreva("Quantidade: ", Objetos.obter_propriedade_tipo_inteiro(produto, "quantidade"), "\n")
    }
}
  
