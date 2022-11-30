-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create DATABASE if not exists GravityFandom;

USE GravityFandom;

CREATE TABLE if not exists usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE if not exists aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE TABLE if not exists jogo (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nick VARCHAR(45),
    horario datetime DEFAULT current_timestamp(),
	fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(id)
);

CREATE TABLE if not exists pontuacao (
	id INT auto_increment,
	ponto INT,
	tempo INT,
	fkJogo INT, FOREIGN KEY (fkjogo) REFERENCES jogo(id),
	primary key (id,fkJogo)
);

-- select tempo as tempo, ponto as ponto from pontuacao join jogo as j on fkJogo = j.id ;
-- SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}'; 
-- INSERT INTO usuario (nome, email, senha) VALUES ('${nome}', '${email}', '${senha}');
-- insert into pontuacao(ponto,tempo,fkJogo) value (${ponto},${timer},${jogo});
-- insert into jogo(nick,fkUsuario) values ('${nick}', '${usuario}');
-- DELETE FROM aviso WHERE id = ${idAviso};
-- INSERT INTO aviso (titulo, descricao, fk_usuario) VALUES ('${titulo}', '${descricao}', ${idUsuario});
-- SELECT  a.id AS idAviso,
-- 	    a.titulo,
-- 		a.descricao,
-- 		a.fk_usuario,
-- 		u.id AS idUsuario,
-- 		u.nome,
-- 		u.email,
-- 		u.senha 
-- 		FROM aviso a INNER JOIN usuario u ON a.fk_usuario = u.id WHERE u.id = ${idUsuario};
-- SELECT  a.id AS idAviso,
-- 	    a.titulo,
-- 		a.descricao,
-- 		a.fk_usuario,
-- 		u.id AS idUsuario,
-- 		u.nome,
-- 		u.email,
-- 		u.senha
--         FROM aviso a INNER JOIN usuario u ON a.fk_usuario = u.id
--         WHERE a.descricao LIKE '${texto}';
-- SELECT  a.id AS idAviso,
-- 		a.titulo,
-- 		a.descricao,
-- 		a.fk_usuario,
-- 		u.id AS idUsuario,
-- 		u.nome,
-- 		u.email,
-- 		u.senha
-- 	    FROM aviso a INNER JOIN usuario u ON a.fk_usuario = u.id;

select * from usuario;
select * from pontuacao;
select * from jogo;
select * from aviso;



CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
