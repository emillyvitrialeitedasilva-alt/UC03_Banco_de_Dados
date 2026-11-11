programa {
  inclua biblioteca Objetos
  funcao inicio() {
    inteiro sabores[4]
        cadeia nome_sabor
        real preco_sabor

        para (inteiro i = 0; i < 4; i++) {
            sabores[i] = Objetos.criar_objeto()

            escreva("Digite o nome do ", i + 1, "º picolé: ")
            leia(nome_sabor)
            
            escreva("Digite o preço do ", i + 1, "º picolé: ")
            leia(preco_sabor)

            Objetos.atribuir_propriedade(sabores[i], "nome", nome_sabor)
            Objetos.atribuir_propriedade(sabores[i], "preco", preco_sabor)
            escreva("\n")
        }

        escreva("\n--- LISTA DE SABORES DE PICOLÉ ---\n")
        para (inteiro i = 0; i < 4; i++) {
            escreva("Sabor: ", Objetos.obter_propriedade_tipo_cadeia(sabores[i], "nome"), 
                    " | Preço: R$ ", Objetos.obter_propriedade_tipo_real(sabores[i], "preco"), "\n")
        }
  }
}
