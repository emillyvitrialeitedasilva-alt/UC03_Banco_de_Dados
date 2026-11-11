programa {
  inclua biblioteca Objetos
  funcao inicio() {
    inteiro produtos[4]
        real valor_total = 0.0

        produtos[0] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(produtos[0], "nome", "Arroz")
        Objetos.atribuir_propriedade(produtos[0], "preco", 25.00)
        Objetos.atribuir_propriedade(produtos[0], "quantidade", 10)

        produtos[1] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(produtos[1], "nome", "Feijao")
        Objetos.atribuir_propriedade(produtos[1], "preco", 8.50)
        Objetos.atribuir_propriedade(produtos[1], "quantidade", 15)

        produtos[2] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(produtos[2], "nome", "Oleo")
        Objetos.atribuir_propriedade(produtos[2], "preco", 7.00)
        Objetos.atribuir_propriedade(produtos[2], "quantidade", 12)

        produtos[3] = Objetos.criar_objeto()
        Objetos.atribuir_propriedade(produtos[3], "nome", "Cafe")
        Objetos.atribuir_propriedade(produtos[3], "preco", 16.00)
        Objetos.atribuir_propriedade(produtos[3], "quantidade", 20)

        para (inteiro i = 0; i < 4; i++) {
            real preco = Objetos.obter_propriedade_tipo_real(produtos[i], "preco")
            inteiro qtd = Objetos.obter_propriedade_tipo_inteiro(produtos[i], "quantidade")
            
            valor_total = valor_total + (preco * qtd)
        }

        escreva("Valor total investido no estoque: R$ ", valor_total, "\n")
    
  }
}
