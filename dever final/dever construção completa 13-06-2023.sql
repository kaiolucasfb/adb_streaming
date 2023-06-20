
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
id_tipo_pagamento INT primary key auto_increment , 
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
id_pais INT primary key auto_increment , 
nome varchar(255),
codigo varchar(255)
)auto_increment = 1;



create table tb_endereco (
id_endereco INT primary key auto_increment,
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
id_temporada INT primary key auto_increment ,
titulo VARCHAR(50),
descricao VARCHAR(100)
)AUTO_INCREMENT = 1;

create table tb_faixa_etaria(
id_faixa_etaria INT primary key auto_increment ,
idade ENUM('+12','+14','+16','+18') NOT NULL,
descricao VARCHAR(100)
)auto_increment = 1;

create table tb_catalogo(
id_catalogo int primary key auto_increment ,
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
id_filme INT primary key auto_increment , 
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

CREATE TABLE tb_episodio (
  id_episodio INT PRIMARY KEY AUTO_INCREMENT,
  qtd_episodio INT NOT NULL,
  nu_episodio INT NOT NULL,
  id_temporada INT NOT NULL,
  id_catalogo INT NOT NULL,
  CONSTRAINT fk_id_temporada_episodio FOREIGN KEY (id_temporada) REFERENCES tb_temporada (id_temporada),
  CONSTRAINT fk_id_catalogo_episodio FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

create table tb_catalogo_idioma(
id_catalogo INT NOT NULL,
id_idioma INT NOT NULL,
primary key(id_catalogo,id_idioma),
CONSTRAINT fk_id_catalogo_idioma FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo),
CONSTRAINT fk_id_idioma_catalogo FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma)
);

create table tb_serie(
id_serie int primary key auto_increment,
qtd_temporada int not null,
id_catalogo int not null,
constraint fk_id_serie_catalogo foreign key (id_catalogo) references tb_catalogo (id_catalogo)
)auto_increment = 1;

create table tb_serie_temporada (
id_serie int not null,
id_catalogo int not null,
primary key(id_serie,id_catalogo),
constraint fk_id_serie_temporada foreign key (id_serie) references tb_serie (id_serie),
constraint fk_id_temporada_serie foreign key(id_catalogo) references tb_catalogo (id_catalogo)
);

create table tb_catalogo_idioma(
id_idioma int not null,
id_catalogo int not null,
primary key (id_idioma,id_catalogo),
constraint fk_id_catalogo_idioma foreign key (id_idioma) references tb_idioma (id_idioma),
constraint fk_id_ foreign key(id_catalogo) references tb_catalogo (id_catalogo)
);

create table tb_catalogo_faixa_etaria (
id_faixa_etaria int not null,
id_catalogo int not null,
constraint fk_id_faixa_etaria foreign key (id_faixa_etaria) references tb_faixa_etaria (id_faixa_etaria),
constraint fk_id_categoria_catalogo foreign key(id_catalogo) references tb_catalogo (id_catalogo)
);
