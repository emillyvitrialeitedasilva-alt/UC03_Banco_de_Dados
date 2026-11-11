programa {
  inclua biblioteca Objetos
  funcao inicio() {
    // VERSÃO CORRIGIDA:
        inteiro cliente
        
        // Correção 1: Inicializando o objeto corretamente
        cliente = Objetos.criar_objeto()

        // Atribuindo as propriedades
        Objetos.atribuir_propriedade(cliente, "nome", "Joana")
        Objetos.atribuir_propriedade(cliente, "idade", 30)

        // Exibindo os dados com as funções de tipo corretas
        escreva("Nome: ", Objetos.obter_propriedade_tipo_cadeia(cliente, "nome"), "\n")
        escreva("Idade: ", Objetos.obter_propriedade_tipo_inteiro(cliente, "idade"), "\n") // Correção 2: Usando o tipo inteiro
    }
}

