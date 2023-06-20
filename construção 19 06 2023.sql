
    
/*-------------- create database---------------

CREATE DATABASE db_netflix 
COLLATE utf8mb4_general_ci
CHARSET utf8mb4;

use db_netflix;


create table tb_plano (
id_plano INT primary key auto_increment  ,
valor FLOAT(3,2) unique,
descricao varchar(255)
)auto_increment = 1;
create table tb_funcionario (
id_funcionario INT primary key auto_increment ,
dt_demissão DATE,
salario float(3,2),
foto varchar(255)
)auto_increment = 1;
create table tb_cartao_credito (
id_cartao_credito INT primary key auto_increment ,
numero INT not null,
dt_vencmento  DATE not null,
cod_seguranca CHAR(8) not null,
titular varchar(255)
)auto_increment = 1;
create table tb_tipo_pagamento (
id_tipo_pagamento INT primary key auto_increment, 
nome varchar(255)
)auto_increment = 1;
create table tb_cliente (
id_cliente INT primary key auto_increment  , 
cpf INT NOT NULL unique, 
dt_vencimento DATE NOT NULL, 
id_plano INT NOT NULL,
id_cartao_credito INT NOT NULL,
   CONSTRAINT fk_plano FOREIGN KEY (id_plano) REFERENCES tb_plano (id_plano),
   CONSTRAINT fk_cartao_credito FOREIGN KEY (id_cartao_credito) REFERENCES tb_cartao_credito (id_cartao_credito)
)auto_increment = 1;
create table tb_pagamento (
id_pagamento INT primary key auto_increment, 
valor FLOAT (3,2)  NOT NULL,
dt_pagamento DATE NOT NULL,
id_cartao_credito INT NOT NULL,
id_tipo_pagamento INT NOT NULL,
id_cliente INT NOT NULL,
   CONSTRAINT fk_pagamento_cartao_credito FOREIGN KEY (id_cartao_credito) REFERENCES tb_cartao_credito (id_cartao_credito),
    CONSTRAINT fk_pagamento_tipo_pagamento FOREIGN KEY (id_tipo_pagamento) REFERENCES tb_tipo_pagamento (id_tipo_pagamento),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
    
) AUTO_INCREMENT = 1;
create table tb_perfil(
id_perfl INT primary key auto_increment,
foto varchar(255) not null,
nome varchar(255)not null,
tipo varchar(255) not null, 
id_cliente INT NOT NULL,
constraint fk_perfil_cliente foreign key (id_cliente) references tb_cliente (id_cliente)
)auto_increment = 1;
create table tb_pais (
id_pais INT primary key, 
nome varchar(255),
codigo varchar(255)
)auto_increment = 1;
create table tb_endereco (
id_endereco INT primary key,
rua varchar(255) not null,
quadra varchar(255) not null,
bairro varchar(255) not null,
cidade varchar(255) not null,
id_pais INT NOT NULL,
constraint fk_pais foreign key (id_pais) references tb_pais (id_pais)
)auto_increment = 1;
create table tb_usuario(
id_usuario INT primary key auto_increment,
senha  VARCHAR(8) NOT NULL,
dt_castro DATE NOT NULL,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
atividade BOOLEAN,
dt_nascimento DATE NOT NULL,
dt_cadastro DATE NOT NULL,
id_cliente INT NOT NULL,
CONSTRAINT fk_usuario_endereco FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
)auto_increment = 1;
create table tb_ator (
id_ator INT PRIMARY KEY auto_increment,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
dt_nascimento DATE NOT NULL,
foto VARCHAR(255)
)auto_increment = 1 ;
create table tb_idioma(
id_idioma INT primary key auto_increment,
nome VARCHAR(50)
)AUTO_INCREMENT = 1;
create table tb_categoria(
id_categoria INT primary key auto_increment,
nome VARCHAR(50)
)AUTO_INCREMENT = 1;
create table tb_temporada(
id_temporada INT primary key auto_increment,
titulo VARCHAR(50),
descricao VARCHAR(100)
)AUTO_INCREMENT = 1;
create table tb_faixa_etaria(
id_faixa_etaria INT primary key,
idade ENUM('+12','+14','+16','+18') NOT NULL,
descricao VARCHAR(100)
)auto_increment = 1;
create table tb_catalogo(
id_catalogo int primary key,
pais_origem varchar(255) not null,
imagem_capa varchar(255) not null,
titulo varchar(255) not null,
sinopse varchar(255) not null,
dt_lancamento DATE not null,
idioma_original VARCHAR(255),
duracao TIME not NULL ,
id_pais int not null, 
id_faixa_etaria int not null,
id_idioma int not null,
constraint fk_catalogo_id_pais foreign key (id_pais) references tb_pais (id_pais),
constraint fk_catalogo_faixa_etaria foreign key (id_faixa_etaria) references tb_faixa_etaria (id_faixa_etaria),
constraint fk_catalogo_idioma foreign key (id_idioma) references tb_idioma (id_idioma)
);
create table tb_catalogo_ator(
id_catalogo INT NOT NULL,
id_ator INT NOT NULL,
primary key(id_catalogo,id_ator),
CONSTRAINT fk_catalogo_ator FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo),
CONSTRAINT fk_ator_catalogo FOREIGN KEY (id_ator) REFERENCES tb_ator (id_ator)
);
create table tb_filme (
id_filme INT primary key, 
oscar VARCHAR(100),
id_catalogo INT NOT NULL,
constraint fk_filme_catalogo foreign key (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
)auto_increment = 1;
create table tb_episodio(
id_episodio INT primary key auto_increment,
qtd_episodio INT NOT NULL,
nu_episodio INT NOT NULL,
id_temporada INT NOT NULL,
id_catalogo INT NOT NULL,
constraint fk_id_temporada_episodo foreign key (id_temporada) references tb_temporada (id_temporada),
constraint fk_id_catalogo_episodo foreign key (id_catalogo) references tb_catalogo (id_catalogo)
)auto_increment = 1;
create table tb_catalogo_idioma(
id_catalogo INT NOT NULL,
id_idioma INT NOT NULL,
primary key(id_catalogo,id_idioma),
CONSTRAINT fk_id_catalogo_idioma FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo),
CONSTRAINT fk_id_idioma_catalogo FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma)
);
create table tb_serie(
id_serie int primary key,
qtd_temporada int not null,
id_catalogo int not null,
constraint fk_id_serie_catalogo foreign key (id_catalogo) references tb_catalogo (id_catalogo)
)auto_increment = 1;
create table tb_catalogo_idioma (
id_idioma int not null,
id_catalogo int not null,
primary key(id_idioma,id_catalogo),
constraint fk_id_idioma_catalogo foreign key (id_idioma) references tb_idioma (id_idioma),
constraint fk_id_catalogo_idioma foreign key (id_catalogo) references tb_catalogo (id_catalogo)
);
create table tb_catalogo_faixa_etaria (
id_faixa_etaria int not null,
id_catalogo int not null,
primary key(id_faixa_etaria,id_catalogo),
constraint fk_id_faixa_etaria foreign key (id_faixa_etaria) references tb_faixa_etaria (id_faixa_etaria),
constraint fk_id_categoria_catalogo foreign key(id_catalogo) references tb_catalogo (id_catalogo));
create table tb_catalogo_ator (
id_ator int not null,
id_catalogo int not null,
primary key (id_ator, id_catalogo),
constraint fk_id_catalogo_ator foreign key (id_ator) references tb_ator (id_ator),
constraint fk_id_ator_catalogo foreign key(id_catalogo) references tb_catalogo (id_catalogo));
create table tb_serie_temporada(
id_serie INT,
id_temporada INT,
primary key (id_serie, id_temporada),
constraint fk_id_serie_temporada foreign key (id_serie) references tb_serie (id_serie),
constraint fk_id_temporada_serie foreign key (id_temporada) references tb_temporada (id_temporada));*/

/* --------------- inserts ---------------
/*select * from tb_faixa_etaria;
INSERT INTO tb_faixa_etaria (idade, descricao) VALUES ('+12', 'Livre para maiores de 12 anos');
INSERT INTO tb_faixa_etaria (id_faixa_etaria,idade, descricao) VALUES (2,'+14', 'Livre para maiores de 14 anos');
INSERT INTO tb_faixa_etaria (id_faixa_etaria,idade, descricao) VALUES (3,'+16', 'Livre para maiores de 16 anos');
INSERT INTO tb_faixa_etaria (id_faixa_etaria,idade, descricao) VALUES (4,'+18', 'Livre para maiores de 18 anos');



 /*select * from tb_pais;
INSERT INTO tb_pais (id_pais, nome, codigo) VALUES (1, 'Brasil', 'BR');
INSERT INTO tb_pais (id_pais, nome, codigo) VALUES (2, 'Estados Unidos', 'US');
INSERT INTO tb_pais (id_pais, nome, codigo) VALUES (3, 'Reino Unido', 'UK');

/*select * from tb_plano;
INSERT INTO tb_plano (valor, descricao) VALUES (29.99, 'Plano Básico');
INSERT INTO tb_plano (valor, descricao) VALUES (49.99, 'Plano Padrão');
INSERT INTO tb_plano (valor, descricao) VALUES (79.99, 'Plano Premium');

/*select * from tb_cartao_credito;

INSERT INTO tb_cartao_credito (numero, dt_vencmento, cod_seguranca, titular) VALUES (1234567890123456, '2023-12-31', '12345678', 'João Silva');
INSERT INTO tb_cartao_credito (numero, dt_vencmento, cod_seguranca, titular) VALUES (9876543210987654, '2024-06-30', '87654321', 'Maria Santos');
INSERT INTO tb_cartao_credito (numero, dt_vencmento, cod_seguranca, titular) VALUES (5555444433332222, '2025-03-31', '99998888', 'Pedro Oliveira');

/*select * from tb_cliente;

INSERT INTO tb_cliente (cpf, dt_vencimento, id_plano, id_cartao_credito) VALUES (12345678901, '2023-12-31', 1, 1);
INSERT INTO tb_cliente (cpf, dt_vencimento, id_plano, id_cartao_credito) VALUES ('00000000000', '2024-06-30', 2, 2);
INSERT INTO tb_cliente (cpf, dt_vencimento, id_plano, id_cartao_credito) VALUES ('11111111111', '2025-03-31', 3, 3);

/*select * from tb_tipo_pagamento;
INSERT INTO tb_tipo_pagamento (nome) VALUES ('Boleto');
INSERT INTO tb_tipo_pagamento (nome) VALUES ('Transferência Bancária');
INSERT INTO tb_tipo_pagamento (nome) VALUES ('PIX');

/*select * from tb_usuario;
INSERT INTO tb_usuario (id_usuario, senha, dt_castro, nome, sobrenome, email, atividade, dt_nascimento, dt_cadastro, id_cliente) 
VALUES (1, 'senha123', '2023-06-01', 'João', 'Silva', 'joao@email.com', 1, '1990-05-15', '2023-06-01', 1);
INSERT INTO tb_usuario (id_usuario, senha, dt_castro, nome, sobrenome, email, atividade, dt_nascimento, dt_cadastro, id_cliente) 
VALUES (2, 'abc123', '2023-06-02', 'Maria', 'Santos', 'maria@email.com', 1, '1988-10-20', '2023-06-02', 7);

/*select * from tb_funcionario;
ALTER TABLE tb_funcionario MODIFY COLUMN salario DECIMAL(8,2);
INSERT INTO tb_funcionario (dt_demissão, salario, foto) VALUES ('2023-05-10', 2500.00, 'foto');
INSERT INTO tb_funcionario (dt_demissão, salario, foto) VALUES (NULL, 3500.00, 'foto');
INSERT INTO tb_funcionario (dt_demissão, salario, foto) VALUES ('2023-04-20', 2000.00, 'foto4.jpg');



select * from tb_endereco;
INSERT INTO tb_endereco (id_endereco, rua, quadra, bairro, cidade, id_pais) 
VALUES (1, 'Rua A', 'Quadra 1', 'Centro', 'São Paulo', 1);

INSERT INTO tb_endereco (id_endereco, rua, quadra, bairro, cidade, id_pais) 
VALUES (2, 'Rua B', 'Quadra 2', 'Copacabana', 'Rio de Janeiro', 1);

INSERT INTO tb_endereco (id_endereco, rua, quadra, bairro, cidade, id_pais) 
VALUES (3, 'Rua C', 'Quadra 3', 'Savassi', 'Belo Horizonte', 1);

/*select * from tb_usuario;
INSERT INTO tb_usuario (id_usuario, senha, dt_castro, nome, sobrenome, email, atividade, dt_nascimento, dt_cadastro, id_cliente) 
VALUES (1, 'senha123', '2023-06-01', 'João', 'Silva', 'joao@email.com', 1, '1990-05-15', '2023-06-01', 1);

INSERT INTO tb_usuario (id_usuario, senha, dt_castro, nome, sobrenome, email, atividade, dt_nascimento, dt_cadastro, id_cliente) 
VALUES (2, 'abc123', '2023-06-02', 'Maria', 'Santos', 'maria@email.com', 1, '1988-10-20', '2023-06-02', 7);

/*select * from tb_perfil;
INSERT INTO tb_perfil (foto, nome, tipo, id_cliente) VALUES ('foto', 'Perfil 1', 'normal', 1);
INSERT INTO tb_perfil (foto, nome, tipo, id_cliente) VALUES ('foto', 'Perfil 2', 'infantil', 7);

/*select * from tb_idioma;
INSERT INTO tb_idioma (nome) VALUES ('Brasileiro');
INSERT INTO tb_idioma (nome) VALUES ('Inglês');

/*select * from tb_categoria;
INSERT INTO tb_categoria (nome) VALUES ('Ação');
INSERT INTO tb_categoria (nome) VALUES ('Comédia');
INSERT INTO tb_categoria (nome) VALUES ('Drama');
INSERT INTO tb_categoria (nome) VALUES ('Ficção Científica');
INSERT INTO tb_categoria (nome) VALUES ('Romance');

/*select * from tb_ator;
INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
VALUES ('Benedict', 'Cumberbatch', '1976-07-19', 'foto');
INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
VALUES ('Martin', 'Freeman', '1971-09-08', 'link_para_foto_martin');
INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
VALUES ('Keanu', 'Reeves', '1964-09-02', 'foto');
INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
VALUES ('Laurence', 'Fishburne', '1961-07-30', 'foto');

/*select * from tb_catalogo;
INSERT INTO tb_catalogo (pais_origem, imagem_capa, titulo, sinopse, dt_lancamento, idioma_original, duracao, id_pais, id_faixa_etaria, id_idioma)
VALUES ('Estados Unidos', 'capa', 'The Matrix', 'The Matrix acompanha a aventura de Neo, um jovem hacker que é chamado para o movimento de resistência liderado por Morpheus, na luta contra a dominação dos humanos pelas máquinas.', '1999-03-31', 'Inglês', '2:16:00', 2, 4, 2);

select * from tb_pais;
INSERT INTO tb_catalogo (id_catalogo, pais_origem, imagem_capa, titulo, sinopse, dt_lancamento, idioma_original, duracao, id_pais, id_faixa_etaria, id_idioma)
VALUES (1, 'Reino Unido', 'capa', 'Sherlock', 'Sir Arthur Conan Doyle, Sherlock conta as aventuras do detetive particular Sherlock Holmes e seu fiel escudeiro, na Inglaterra dos dias de hoje.', '2010-07-25', 'Inglês', '1:30:00', 2, 3, 2);

/*INSERT INTO tb_filme (id_filme, oscar, id_catalogo)
VALUES (1, 'Melhor Filme 1999', 0);

/*INSERT INTO tb_serie (id_serie, qtd_temporada, id_catalogo)
VALUES (1,4,1 );

/*select * from tb_temporada;
INSERT INTO tb_temporada (id_temporada, titulo, descricao)
VALUES (1, 'A Scandal in Belgravia', 'A monarquia é ameaçada pelo surgimento de algumas fotografias comprometedoras. Sherlock é logo colocado no caso e descobre ligações entre o terrorismo internacional e a corrupção no governo britânico.');

INSERT INTO tb_temporada (id_temporada, titulo, descricao)
VALUES (2, 'The Hounds of Baskerville', 'Henry Knight afirma que seu pai foi morto por uma criatura monstruosa em Dartmoor, e pede a Sherlock para ajudá-lo. Quando ele e John Watson chegam para investigar, eles descobrem que uma base militar ultra-secreta pode estar ligada à morte.');

INSERT INTO tb_temporada (id_temporada, titulo, descricao)
VALUES (3, 'The Reichenbach Fall', 'Moriarty dá início ao que pode ser o crime do século: invadir a Torre de Londres, o Banco da Inglaterra e a Prisão de Pentonville.');

INSERT INTO tb_temporada (id_temporada, titulo, descricao)
VALUES (4, 'Many Happy Returns', 'Uma série de crimes aparentemente desconexos, estendendo-se do Tibet, Índia e Alemanha. Sherlock Holmes desapareceu há dois anos. Mas alguém não está muito convencido de que ele está morto.');

INSERT INTO tb_temporada (id_temporada, titulo, descricao)
VALUES (5, 'The Six Thatchers', 'Um caso misterioso em especial confunde a Scotland Yard - mas Sherlock está mais interessado em um detalhe aparentemente-trivial.'); 

INSERT INTO tb_episodio ( qtd_episodio, nu_episodio, id_temporada, id_catalogo)
VALUES ( 3, 1, 1, 1);

INSERT INTO tb_episodio ( qtd_episodio, nu_episodio, id_temporada, id_catalogo)
VALUES ( 3, 2, 2, 1);

INSERT INTO tb_episodio ( qtd_episodio, nu_episodio, id_temporada, id_catalogo)
VALUES ( 3, 3, 2, 1); 

INSERT INTO tb_episodio ( qtd_episodio, nu_episodio, id_temporada, id_catalogo)
VALUES ( 3, 1, 3, 1);

INSERT INTO tb_episodio ( qtd_episodio, nu_episodio, id_temporada, id_catalogo)
VALUES ( 3, 2, 4, 1);

INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma) VALUES (0, 1);
INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma) VALUES (0, 2);

INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma) VALUES (1, 1);
INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma) VALUES (1, 2);


select * from tb_catalogo;
select * from tb_faixa_etaria;

INSERT INTO tb_catalogo_ator (id_catalogo, id_ator) VALUES (0, 3);
INSERT INTO tb_catalogo_ator (id_catalogo, id_ator) VALUES (0, 4);
INSERT INTO tb_catalogo_ator (id_catalogo, id_ator) VALUES (1, 1);
INSERT INTO tb_catalogo_ator (id_catalogo, id_ator) VALUES (1, 2);



INSERT INTO tb_catalogo_faixa_etaria (id_catalogo, id_faixa_etaria) VALUES ('0','4');
INSERT INTO tb_catalogo_faixa_etaria (id_catalogo, id_faixa_etaria) VALUES ('1','3');

INSERT INTO tb_serie_temporada (id_serie, id_temporada) VALUES ('1','1');
INSERT INTO tb_serie_temporada (id_serie, id_temporada) VALUES ('1','2');
INSERT INTO tb_serie_temporada (id_serie, id_temporada) VALUES ('1','3');
INSERT INTO tb_serie_temporada (id_serie, id_temporada) VALUES ('1','4');
INSERT INTO tb_serie_temporada (id_serie, id_temporada) VALUES ('1','5');


select * from tb_tipo_pagamento;
select * from tb_pagamento;


INSERT INTO tb_pagamento (id_pagamento, valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (1, 9.99, '2023-06-16', 1, 3, 1);  

INSERT INTO tb_pagamento (id_pagamento, valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
VALUES (2, 9.99, '2022-06-16', 1, 2, 7); 

*/
 

 -------------- procedures delete --------------
  DELIMITER //
CREATE PROCEDURE sp_deletar_ator(IN cod_ator INT)
BEGIN
    DELETE FROM tb_ator
    WHERE id_ator = cod_ator;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_cartao_credito(IN cod_cartao_credito INT)
BEGIN
    DELETE FROM tb_cartao_credito
    WHERE id_cartao_credito = cod_cartao_credito;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_catalogo(IN cod_catalogo INT)
BEGIN
    DELETE FROM tb_catalogo
    WHERE id_catalogo = cod_catalogo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_catalogo_faixa_etaria (IN cod_faixa_etaria INT)
BEGIN
    DELETE FROM tb_catalogo_faixa_etaria
    WHERE id_catalogo and id_faixa_etaria = cod_faixa_etaria;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_catalogo_ator(IN cod_catalogo_ator INT)
BEGIN
    DELETE FROM tb_catalogo_ator
    WHERE id_catalogo and id_ator = cod_catalogo_ator;

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_catalogo_idioma(IN cod_catalogo_idioma INT)
BEGIN
    DELETE FROM tb_catalogo_idioma
    WHERE id_catalogo and id_idioma = cod_catalogo_idioma;
END //
DELIMITER ;




DELIMITER //
CREATE PROCEDURE sp_deletar_categoria(IN cod_categoria INT)
BEGIN
    DELETE FROM tb_categoria
    WHERE id_categoria = cod_categoria;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_cliente(IN cod_cliente INT)
BEGIN
    DELETE FROM tb_cliente
    WHERE id_cliente = cod_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_deletar_endereco(IN cod_endereco INT)
BEGIN
    DELETE FROM tb_endereco
    WHERE id_endereco = cod_endereco;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_deletar_faixa_etaria(IN cod_faixa_etaria INT)
BEGIN
    DELETE FROM tb_faixa_etaria
    WHERE id_faixa_etaria = cod_faixa_etaria;
END //

DELIMITER ;


DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_deletar_filme(IN cod_filme INT)
BEGIN
    DELETE FROM tb_filme
    WHERE id_filme = cod_filme;
END //

DELIMITER;


DELIMITER //

CREATE PROCEDURE sp_deletar_funcionario(IN cod_funcionario INT)
BEGIN
    DELETE FROM tb_funcionario
    WHERE id_funcionario = cod_funcionario;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_deletar_idioma(IN cod_idioma INT)
BEGIN
    DELETE FROM tb_idioma
    WHERE id_idioma = cod_idioma;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_deletar_pagamento(IN cod_pagamento INT)
BEGIN
    DELETE FROM tb_pagamento
    WHERE id_pagamento = cod_pagamento;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_deletar_pais(IN cod_pais INT)
BEGIN
    DELETE FROM tb_pais
    WHERE id_pais = cod_pais;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_deletar_perfil(IN cod_perfil INT)
BEGIN
    DELETE FROM tb_perfil
    WHERE id_perfil = cod_perfil;
END //

DELIMITER ;

DELIMITER \\
CREATE PROCEDURE sp_inserir_serie_temporada( cod_id_serie INT,  cod_id_temporada INT)
BEGIN
    INSERT INTO tb_serie_temporada
    (id_serie, id_temporada)
    
    VALUES 
 (cod_id_serie, cod_id_temporada);
end \\

DELIMITER ;


DELIMITER \\

CREATE PROCEDURE sp_inserir_catalogo_idioma( cod_id_catalogo INT,  cod_id_idioma INT)
BEGIN
    INSERT INTO tb_catalogo_idioma
    (id_catalogo, id_idioma)
    
    VALUES 
 (cod_id_catalogo, cod_id_idioma);
end \\

DELIMITER ;


DELIMITER \\

CREATE PROCEDURE sp_inserir_catalogo_ator( cod_id_catalogo INT,  cod_id_ator INT)
BEGIN
    INSERT INTO tb_catalogo_ator
    (id_catalogo, id_ator)
    
    VALUES 
 (cod_id_catalogo, cod_id_ator);
end \\

DELIMITER ;DELIMITER \\

CREATE PROCEDURE sp_inserir_serie_temporada( cod_id_serie INT,  cod_id_temporada INT)
BEGIN
    INSERT INTO tb_serie_temporada
    (id_serie, id_temporada)
    
    VALUES 
 (cod_id_serie, cod_id_temporada);
end \\

DELIMITER ;

DELIMITER \\

CREATE PROCEDURE sp_inserir_catalogo_idioma( cod_id_catalogo INT,  cod_id_idioma INT)
BEGIN
    INSERT INTO tb_catalogo_idioma
    (id_catalogo, id_idioma)
    
    VALUES 
 (cod_id_catalogo, cod_id_idioma);
end \\

DELIMITER ;


DELIMITER \\

CREATE PROCEDURE sp_inserir_catalogo_ator( cod_id_catalogo INT,  cod_id_ator INT)
BEGIN
    INSERT INTO tb_catalogo_ator
    (id_catalogo, id_ator)
    
    VALUES 
 (cod_id_catalogo, cod_id_ator);
end \\

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_deletar_plano(IN cod_plano INT)
BEGIN
    DELETE FROM tb_plano
    WHERE id_plano = cod_plano;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_deletar_serie(IN cod_seriem INT)
BEGIN
    DELETE FROM tb_seriem
    WHERE id_seriem = cod_seriem;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_deletar_temporada(IN cod_temporada INT)
BEGIN
    DELETE FROM tb_temporada
    WHERE id_temporada = cod_temporada;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_deletar_tipo_pagamento(IN cod_tipo_pagamento INT)
BEGIN
    DELETE FROM tb_tipo_pagamento
    WHERE id_tipo_pagamento = cod_tipo_pagamento;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_deletar_usuario(IN cod_usuario INT)
BEGIN
    DELETE FROM tb_usuario
    WHERE id_usuario = cod_usuario;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_ator( cod_nome VARCHAR(50),  cod_sobrenome VARCHAR(50),  
                                   cod_dt_nascimento DATE,  cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
    VALUES (p_nome, p_sobrenome, p_dt_nascimento, p_foto);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_usuario( cod_senha VARCHAR(8),  cod_dt_cadastro DATE, 
                                       cod_nome VARCHAR(50), cod_sobrenome VARCHAR(50), 
                                       cod_email VARCHAR(50), cod_atividade TINYINT(1), 
                                       cod_dt_nascimento DATE, cod_id_cliente INT)
BEGIN
    INSERT INTO tb_usuario (senha, dt_cadastro, 
                            nome, sobrenome, email, 
							atividade, dt_nascimento, id_cliente)
                            
    VALUES (cod_senha, cod_dt_cadastro, 
		    cod_nome, cod_sobrenome, 
            cod_email, cod_atividade, 
            cod_dt_nascimento, cod_id_cliente);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_usuario( cod_senha VARCHAR(8),  cod_dt_cadastro DATE,  
                                     cod_nome VARCHAR(50),  cod_sobrenome VARCHAR(50), 
                                     cod_email VARCHAR(50),  cod_atividade TINYINT(1),  
								     cod_dt_nascimento DATE,  cod_id_cliente INT)
BEGIN
    INSERT INTO tb_usuario (senha, dt_cadastro, 
                            nome, sobrenome, email, 
							atividade, dt_nascimento, id_cliente)
    
    VALUES (cod_senha, cod_dt_cadastro, 
			cod_nome, cod_sobrenome, p_email, 
            cod_atividade, cod_dt_nascimento, 
            cod_id_cliente);
END //
DELIMITER ;

DELIMITER \\

CREATE PROCEDURE sp_inserir_serie_temporada( cod_id_serie INT,  cod_id_temporada INT)
BEGIN
    INSERT INTO tb_serie_temporada
    (id_serie, id_temeporada)
    
    VALUES 
 (cod_id_serie, cod_id_temporada);
end//
DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_tipo_pagamento(cod_nome VARCHAR(255))
BEGIN
    INSERT INTO tb_tipo_pagamento 
           (nome)
    VALUES 
         (cod_nome);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_temporada(cod_titulo VARCHAR(50), cod_descricao VARCHAR(100))
BEGIN
    INSERT INTO tb_temporada (titulo, descricao)
    VALUES (cod_titulo, cod_descricao);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_serie( cod_qtd_temporada INT, cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_serie (qtd_temporada, id_catalogo)
    VALUES (cod_qtd_temporada, cod_id_catalogo);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_plano(cod_valor FLOAT(4,2), cod_descricao VARCHAR(255))
BEGIN
    INSERT INTO tb_plano 
    (valor, descricao)
    VALUES 
(cod_valor, cod_descricao);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_perfil(cod_foto VARCHAR(255), cod_nome VARCHAR(255), cod_tipo VARCHAR(255), cod_id_cliente INT)
BEGIN
    INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
    VALUES (cod_foto, cod_nome,cod_id_cliente);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_pais(cod_nome VARCHAR(255), cod_codigo VARCHAR(255))
BEGIN
    INSERT INTO tb_pais (nome, codigo)
    VALUES (cod_nome, cod_codigo);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_pagamento(cod_valor FLOAT(3,2), cod_dt_pagamento DATE, cod_id_cartao_credito INT, cod_id_tipo_pagamento INT, cod_id_cliente INT)
BEGIN
    INSERT INTO tb_pagamento (valor, dt_pagamento, 
                              id_cartao_credito, id_tipo_pagamento, 
                              id_cliente)
    VALUES 
    
    (cod_valor, cod_dt_pagamento, 
    cod_id_cartao_credito, 
    cod_id_tipo_pagamento, cod_id_cliente);

END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_idioma(cod_nome VARCHAR(50))
BEGIN
    INSERT INTO tb_idioma 
    
    (nome)
    
    VALUES 
    
    (cod_nome);

END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_funcionario(cod_dt_demissao DATE, cod_salario FLOAT(3,2), cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_funcionario 
    
    (dt_demissao, salario, foto)
    
    VALUES 
    
    (cod_dt_demissao, cod_salario, cod_foto);
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_filme(cod_oscar VARCHAR(100), cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_filme 
    
    (oscar, id_catalogo)
    
    VALUES 
    
    (cod_oscar, cod_id_catalogo);
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_inserir_faixa_etaria
(cod_idade ENUM('+12', '+14', '+16', '+18'), cod_descricao VARCHAR(100))
BEGIN
    INSERT INTO tb_faixa_etaria 
         (idade, descricao)
    VALUES 
    (cod_idade, cod_descricao);
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_endereco(cod_rua VARCHAR(255), cod_quadra VARCHAR(255), 
									cod_bairro VARCHAR(255), cod_cidade VARCHAR(255), 
										    cod_id_pais INT)
BEGIN
    INSERT INTO tb_endereco (rua, quadra, 
							 bairro, cidade, id_pais)
    VALUES
    (cod_rua, cod_quadra, 
	cod_bairro, cod_cidade, cod_id_pais);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_cliente(cod_cpf INT, cod_dt_vencimento DATE, 
                                    cod_id_plano INT, cod_id_cartao_credito INT)
BEGIN
    INSERT INTO tb_cliente 
    (cpf, dt_vencimento, 
    id_plano, id_cartao_credito)
    
    VALUES 
    
    (cod_cpf, cod_dt_vencimento, 
    cod_id_plano, cod_id_cartao_credito);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_idioma(cod_id_catalogo INT, cod_id_idioma INT)
BEGIN
    INSERT INTO tb_catalogo_idioma 
         (id_catalogo, id_idioma)
    VALUES 
    (cod_id_catalogo, cod_id_idioma);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_faixa_etaria(cod_id_faixa_etaria INT, cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_catalogo_faixa_etaria 
         (id_faixa_etaria, id_catalogo)
    VALUES 
     (cod_id_faixa_etaria, cod_id_catalogo);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_ator(cod_id_ator INT, cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_catalogo_ator 
       (id_ator, id_catalogo)
    VALUES 
    (cod_id_ator, cod_id_catalogo);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo(cod_pais_origem VARCHAR(255), cod_imagem_capa VARCHAR(255), 
									 cod_titulo VARCHAR(255), cod_sinopse VARCHAR(255), cod_dt_lancamento DATE, 
									 cod_idioma_original VARCHAR(255), cod_duracao TIME, cod_id_pais INT, 
                                     cod_id_faixa_etaria INT, cod_id_idioma INT)
BEGIN
    INSERT INTO tb_catalogo (pais_origem, imagem_capa, titulo, sinopse, 
                             dt_lancamento, idioma_original, duracao, 
                             id_pais, id_faixa_etaria, id_idioma)
                             
                             
    VALUES (cod_pais_origem, cod_imagem_capa, cod_titulo, 
            cod_sinopse, cod_dt_lancamento, cod_idioma_original, 
            cod_duracao, cod_id_pais, cod_id_faixa_etaria, 
            cod_id_idioma);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_inserir_cartao_credito(cod_numero INT, cod_dt_vencimento DATE, 
                                           cod_cod_seguranca CHAR(8), cod_titular VARCHAR(255))
BEGIN
    INSERT INTO tb_cartao_credito 
    
    (numero, dt_vencimento, 
    cod_seguranca, titular)
    
    VALUES 
    
    (cod_numero, cod_dt_vencimento, 
    cod_cod_seguranca, cod_titular);

END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_inserir_ator(cod_nome VARCHAR(50), cod_sobrenome VARCHAR(50), cod_dt_nascimento DATE, cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_ator 
        (nome, sobrenome, dt_nascimento, foto)
    VALUES 
     (cod_nome, cod_sobrenome, cod_dt_nascimento, cod_foto);

END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_atualizar_usuario(cod_id_usuario INT, cod_senha VARCHAR(8), cod_dt_castro DATE, cod_nome VARCHAR(50), cod_sobrenome VARCHAR(50), cod_email VARCHAR(50), cod_atividade TINYINT, cod_dt_nascimento DATE, cod_dt_cadastro DATE, cod_id_cliente INT)
BEGIN
    UPDATE tb_usuario
    SET senha = cod_senha,          dt_castro = cod_dt_castro, 
         nome = cod_nome,           sobrenome = cod_sobrenome, 
		email = cod_email,          atividade = cod_atividade, 
dt_nascimento = cod_dt_nascimento, id_cliente = cod_id_cliente,
  dt_cadastro = cod_dt_cadastro
    WHERE id_usuario = cod_id_usuario;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_atualizar_plano(cod_id_plano INT, cod_valor FLOAT(3,2), cod_descricao VARCHAR(255))
BEGIN
    UPDATE tb_plano
    SET 
     valor = cod_valor, 
 descricao = cod_descricao
 
    WHERE id_plano = cod_id_plano;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_atualizar_perfil(cod_id_perfil INT, cod_foto VARCHAR(255), 
                                    cod_nome VARCHAR(255), cod_tipo VARCHAR(255), 
                                    cod_id_cliente INT)
BEGIN
    UPDATE tb_perfil
    SET 
         foto = cod_foto, 
         nome = cod_nome, 
         tipo = cod_tipo, 
   id_cliente = cod_id_cliente
   
    WHERE id_perfil = cod_id_perfil;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_atualizar_pais(cod_id_pais INT, 
                                   cod_nome VARCHAR(255), 
								   cod_codigo VARCHAR(255))
BEGIN
    UPDATE tb_pais
    SET 
       nome = cod_nome, 
	 codigo = cod_codigo
     
    WHERE id_pais = cod_id_pais;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_atualizar_pagamento(cod_id_pagamento INT, cod_valor FLOAT(3,2), 
                                        cod_dt_pagamento DATE, cod_id_cartao_credito INT, 
										cod_id_tipo_pagamento INT, cod_id_cliente INT)
BEGIN
    UPDATE tb_pagamento
    SET       
               valor = cod_valor, 
		dt_pagamento = cod_dt_pagamento, 
   id_cartao_credito = cod_id_cartao_credito, 
   id_tipo_pagamento = cod_id_tipo_pagamento, 
          id_cliente = cod_id_cliente
    WHERE id_pagamento = cod_id_pagamento;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_atualizar_idioma(cod_id_idioma INT, cod_nome VARCHAR(50))
BEGIN
    UPDATE tb_idioma
    SET 
       nome = cod_nome
       
    WHERE id_idioma = cod_id_idioma;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_atualizar_funcionario(cod_id_funcionario INT, cod_dt_demissao DATE, 
                                          cod_salario FLOAT(3,2), cod_foto VARCHAR(255))
BEGIN
    UPDATE tb_funcionario
    SET 
             dt_demissao = cod_dt_demissao, 
				 salario = cod_salario, 
					foto = cod_foto
                    
    WHERE id_funcionario = cod_id_funcionario;
END //

DELIMITER ;


*/

DELIMITER //

CREATE PROCEDURE sp_atualizar_filme(cod_id_filme INT, 
                                    cod_oscar VARCHAR(100), 
                                    cod_id_catalogo INT)
BEGIN
    UPDATE tb_filme
    SET 
        oscar = cod_oscar, 
  id_catalogo = cod_id_catalogo
    WHERE id_filme = cod_id_filme;
END //

DELIMITER ;
   

    
DELIMITER //

CREATE PROCEDURE sp_atualizar_endereco(cod_id_endereco INT, 
                                      cod_rua VARCHAR(255), 
                                      cod_quadra VARCHAR(255), 
                                      cod_bairro VARCHAR(255), 
                                      cod_cidade VARCHAR(255), 
                                      cod_id_pais INT)
BEGIN
    UPDATE tb_endereco
	SET         rua = cod_rua, 
			 quadra = cod_quadra, 
			 bairro = cod_bairro, 
			 cidade = cod_cidade, 
			id_pais = cod_id_pais
    WHERE id_endereco = cod_id_endereco;
END //
DELIMITER ;
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
