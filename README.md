# TecWebP1B

Comandos para montar o SQL

CREATE DATABASE groot;

use groot

CREATE TABLE user (
	id	INT	NOT NULL	AUTO_INCREMENT,
	nome	VARCHAR(11)	NOT NULL,
	senha	VARCHAR(11)	NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE pergunta (
	id 	INT NOT NULL		AUTO_INCREMENT,
	texto	TEXT 	NOT NULL,
	tempo	TIMESTAMP,
	idautor	INT NOT NULL,

	PRIMARY KEY (id)
	FOREIGN KEY (idautor)	REFERENCES	(user.id)
);
