/* Prática 18 – Lanchonete – o estoque e o log de preços
USE lanchonete;

-- passos 4 a 6: a trigger do estoque
DROP TRIGGER IF EXISTS tg_item_baixa_estoque;
DELIMITER //
CREATE TRIGGER tg_item_baixa_estoque AFTER INSERT ON item_pedido
FOR EACH ROW
BEGIN
  -- a baixa: UPDATE estoque ... - NEW.quantidade
  -- só o produto do item: NEW.produto_codigo
  -- a unidade vem do pedido: (SELECT unidade_codigo FROM pedido ...)
  UPDATE estoque 
  SET quantidade = quantidade - NEW.quantidade
  WHERE produto_codigo = NEW.produto_codigo
    AND unidade_codigo = (SELECT unidade_codigo FROM pedido WHERE numero = NEW.pedido_numero);
END //
DELIMITER ;

-- passos 7 a 9: o log e a trigger de auditoria
CREATE TABLE log_preco_produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  produto_codigo INT NOT NULL,
  preco_antigo DECIMAL(6,2) NOT NULL,
  preco_novo DECIMAL(6,2) NOT NULL,
  alterado_em DATETIME NOT NULL,
  usuario VARCHAR(100) NOT NULL,
  FOREIGN KEY (produto_codigo) REFERENCES produto (codigo)
);

DROP TRIGGER IF EXISTS tg_produto_preco;
DELIMITER //
CREATE TRIGGER tg_produto_preco AFTER UPDATE ON produto
FOR EACH ROW
BEGIN
  -- IF o preço mudou THEN INSERT no log com OLD, NEW e USER()
  IF OLD.preco_tabela <> NEW.preco_tabela THEN
    INSERT INTO log_preco_produto (produto_codigo, preco_antigo, preco_novo, alterado_em, usuario)
    VALUES (NEW.codigo, OLD.preco_tabela, NEW.preco_tabela, NOW(), USER());
  END IF;
END //
DELIMITER ;

-- passo 10: os testes do quadro 1
-- Teste 1: Inserir item no pedido 11 e verificar baixa no estoque da Tapioca de queijo (código 3) na unidade 1
INSERT INTO item_pedido (pedido_numero, produto_codigo, quantidade, preco_cobrado)
VALUES (11, 3, 2, 13.00);
SELECT * FROM estoque WHERE unidade_codigo = 1 AND produto_codigo = 3;

-- Teste 2: Atualizar disponibilidade de um produto (não mexe no preço, logo não deve gerar linha no log)
UPDATE produto SET disponivel = FALSE WHERE codigo = 6;
SELECT * FROM log_preco_produto;

-- Teste 3: Tentar inserir quantidade maior que o estoque disponível (ex: pedir 20 açaís 500ml, código 2, mas só há 15 no estoque da unidade 1)
-- *Nota: Como a tabela estoque possui CHECK (quantidade >= 0), o banco deve recusar ou gerar erro caso ultrapasse.*
INSERT INTO item_pedido (pedido_numero, produto_codigo, quantidade, preco_cobrado)
VALUES (11, 2, 20, 18.00);


-- passo 11: a ocorrência (pronta; não altere)
UPDATE produto SET preco_tabela = 9.00 WHERE codigo = 1;

-- passo 12: o que o log registrou (SELECT com JOIN)
SELECT 
  l.id,
  p.nome AS produto,
  l.preco_antigo,
  l.preco_novo,
  l.alterado_em,
  l.usuario
FROM log_preco_produto l
JOIN produto p ON l.produto_codigo = p.codigo;