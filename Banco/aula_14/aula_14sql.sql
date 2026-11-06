/* Prática 14 – Lanchonete – o relatório do gerente */
USE lanchonete;

-- pergunta 1: Quantos pedidos a lanchonete tem?
SELECT COUNT(*) AS total_pedidos
FROM pedido;

-- pergunta 2: Quantas unidades de produto foram vendidas? (item_pedido)
SELECT SUM(quantidade) AS total_unidades_vendidas
FROM item_pedido;

-- pergunta 3: Qual o preço médio cobrado e o maior preço cobrado?
SELECT ROUND(AVG(preco_cobrado), 2) AS preco_medio, 
       MAX(preco_cobrado) AS maior_preco
FROM item_pedido;

-- pergunta 4: Quantos pedidos cada unidade recebeu?
SELECT unidade_codigo, 
       COUNT(*) AS total_pedidos
FROM pedido
GROUP BY unidade_codigo;

-- pergunta 5: Quantas unidades de cada produto foram vendidas, da mais vendida?
SELECT produto_codigo, 
       SUM(quantidade) AS total_vendido
FROM item_pedido
GROUP BY produto_codigo
ORDER BY total_vendido DESC;

-- pergunta 6: Quais produtos venderam 3 unidades ou mais?
SELECT produto_codigo, 
       SUM(quantidade) AS total_vendido
FROM item_pedido
GROUP BY produto_codigo
HAVING SUM(quantidade) >= 3;

-- pergunta 7: Quantos pedidos houve em cada dia (dd/mm)?
SELECT DATE_FORMAT(data_hora, '%d/%m') AS dia_mes, 
       COUNT(*) AS total_pedidos
FROM pedido
GROUP BY dia_mes
ORDER BY MIN(data_hora);

-- pergunta 8: A etiqueta do cardápio: NOME EM MAIÚSCULAS – R$ preço (só os disponíveis)
SELECT CONCAT(UPPER(nome), ' – R$ ', preco_tabela) AS etiqueta_cardapio
FROM produto
WHERE disponivel = 1;