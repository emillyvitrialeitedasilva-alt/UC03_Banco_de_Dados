/* Prática 19 – Lanchonete – perfis de acesso e backup
   Salve este arquivo como pratica-19.sql antes de começar. */
USE lanchonete;

-- passos 7 e 8: um GRANT para cada linha do quadro 1

-- Operador de expedição: ler a vw_expedicao
GRANT SELECT ON lanchonete.vw_expedicao TO 'lanch_expedicao'@'localhost';

-- Analista da qualidade: ler o log_preco_produto e o produto
GRANT SELECT ON lanchonete.log_preco_produto TO 'lanch_qualidade'@'localhost';
GRANT SELECT ON lanchonete.produto TO 'lanch_qualidade'@'localhost';

-- Gerente da unidade: ler e alterar produto; ler e inserir pedido e item_pedido; ler estoque + DELETE pedido no passo 8
GRANT SELECT, UPDATE, DELETE ON lanchonete.produto TO 'lanch_gerente'@'localhost';
GRANT SELECT, INSERT ON lanchonete.pedido TO 'lanch_gerente'@'localhost';
GRANT SELECT, INSERT ON lanchonete.item_pedido TO 'lanch_gerente'@'localhost';
GRANT SELECT ON lanchonete.estoque TO 'lanch_gerente'@'localhost';

-- Administrador: tudo, só no banco lanchonete
GRANT ALL PRIVILEGES ON lanchonete.* TO 'lanch_admin'@'localhost';

-- passo 9: tirar uma permissão (REVOKE)
REVOKE DELETE ON lanchonete.produto FROM 'lanch_gerente'@'localhost';

-- passo 10: SHOW GRANTS FOR cada perfil
SHOW GRANTS FOR 'lanch_expedicao'@'localhost';
SHOW GRANTS FOR 'lanch_qualidade'@'localhost';
SHOW GRANTS FOR 'lanch_gerente'@'localhost';
SHOW GRANTS FOR 'lanch_admin'@'localhost';
