/* Prática 15 – Lanchonete – juntando as tabelas
USE lanchonete;

-- pergunta 1: O número de cada pedido e o nome do cliente.
SELECT p.numero, c.nome AS cliente_nome
FROM pedido p
INNER JOIN cliente c ON p.cliente_codigo = c.codigo;

-- pergunta 2: Os pedidos da unidade Ponta Verde (mostre o nome da unidade).
SELECT p.numero, u.nome AS unidade_nome
FROM pedido p
INNER JOIN unidade u ON p.unidade_codigo = u.codigo
WHERE u.nome = 'Ponta Verde';

-- pergunta 3: Os itens do pedido 4: data, nome do produto e quantidade.
SELECT pe.data_hora, pr.nome AS produto_nome, ip.quantidade
FROM item_pedido ip
INNER JOIN pedido pe ON ip.pedido_numero = pe.numero
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
WHERE ip.pedido_numero = 4;

-- pergunta 4: Unidades vendidas de cada produto, com o nome, da mais vendida.
SELECT pr.nome AS produto_nome, SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
GROUP BY pr.codigo, pr.nome
ORDER BY total_vendido DESC;

-- pergunta 5: Quais produtos nunca foram vendidos?
SELECT pr.nome AS produto_nome
FROM produto pr
LEFT JOIN item_pedido ip ON pr.codigo = ip.produto_codigo
WHERE ip.produto_codigo IS NULL;

-- pergunta 6: Quais clientes não fizeram nenhum pedido?
SELECT c.nome AS cliente_nome
FROM cliente c
LEFT JOIN pedido p ON c.codigo = p.cliente_codigo
WHERE p.numero IS NULL;

-- pergunta 7: Quais produtos têm preço de tabela acima da média?
SELECT nome, preco_tabela
FROM produto
WHERE preco_tabela > (SELECT AVG(preco_tabela) FROM produto);

-- pergunta 8: Qual a média de pedidos por unidade?
SELECT AVG(t.qtd_pedidos) AS media_pedidos_por_unidade
FROM (
  SELECT unidade_codigo, COUNT(*) AS qtd_pedidos
  FROM pedido
  GROUP BY unidade_codigo
) AS t;