-- usuarios-local.sql: fica FORA do repositório (tem senha)
CREATE USER IF NOT EXISTS 'lanch_expedicao'@'localhost'
IDENTIFIED BY 'senha_expedicao_segura1';
CREATE USER IF NOT EXISTS 'lanch_qualidade'@'localhost'
IDENTIFIED BY 'senha_qualidade_segura2';
CREATE USER IF NOT EXISTS 'lanch_gerente'@'localhost'
IDENTIFIED BY 'senha_gerente_segura3';
CREATE USER IF NOT EXISTS 'lanch_admin'@'localhost'
IDENTIFIED BY 'senha_admin_segura4';