
/*
DELIMITER //

CREATE PROCEDURE sp_deletar_ator(IN cod_ator INT)
BEGIN
    DELETE FROM tb_ator
    WHERE id_ator = cod_ator;
END //

DELIMITER ;
drop procedure deletar_ator;
call deletar_ator ();
select * from tb_ator; 

DELIMITER //

CREATE PROCEDURE sp_deletar_cartao_credito(IN cod_cartao_credito INT)
BEGIN
    DELETE FROM tb_cartao_credito
    WHERE id_cartao_credito = cod_cartao_credito;
END //

DELIMITER ;
drop procedure sp_deletar_cartao_credito;
call sp_deletar_ator ();
select * from tb_cartao_credito; 

DELIMITER //


CREATE PROCEDURE sp_deletar_catalogo(IN cod_catalogo INT)
BEGIN
    DELETE FROM tb_catalogo
    WHERE id_catalogo = cod_catalogo;
END //

DELIMITER ;
drop procedure deletar_ator;
call spdeletar_catalogo ();
select * from tb_catalogo; 


DELIMITER //

CREATE PROCEDURE sp_deletar_catalogo_faixa_etaria (IN cod_faixa_etaria INT)
BEGIN
    DELETE FROM tb_catalogo_faixa_etaria
    WHERE id_catalogo and id_faixa_etaria = cod_faixa_etaria;
END //

DELIMITER ;
drop procedure sp_catalogo_faixa_etaria;
call sp_catalogo_faixa_etaria ();
select * from tb_catalogo_faixa_etaria; 

DELIMITER //

CREATE PROCEDURE sp_deletar_catalogo_ator(IN cod_catalogo_ator INT)
BEGIN
    DELETE FROM tb_catalogo_ator
    WHERE id_catalogo and id_ator = cod_catalogo_ator;
END //

DELIMITER ;
drop procedure sp_catalogo_ator;
call sp_catalogo_ator (.);
select * from tb_catalogo_ator; 

DELIMITER //

CREATE PROCEDURE sp_deletar_catalogo_idioma(IN cod_catalogo_idioma INT)
BEGIN
    DELETE FROM tb_catalogo_idioma
    WHERE id_catalogo and id_idioma = cod_catalogo_idioma;
END //

DELIMITER ;
drop procedure deletar_ator;
call deletar_ator (47);
select * from tb_ator; 



DELIMITER //




CREATE PROCEDURE sp_deletar_categoria(IN cod_categoria INT)
BEGIN
    DELETE FROM tb_categoria
    WHERE id_categoria = cod_categoria;
END //

DELIMITER ;
drop procedure sp_deletar_categoria;
call sp_deletar_categoria ();
select * from tb_categoria; 

DELIMITER //
CREATE PROCEDURE sp_deletar_cliente(IN cod_cliente INT)
BEGIN
    DELETE FROM tb_cliente
    WHERE id_cliente = cod_cliente;
END //

DELIMITER ;
drop procedure sp_deletar_cliente;
call sp_deletar_cliente (47);
select * from tb_ator; 



DELIMITER //

CREATE PROCEDURE sp_deletar_endereco(IN cod_endereco INT)
BEGIN
    DELETE FROM tb_endereco
    WHERE id_endereco = cod_endereco;
END //

DELIMITER ;
drop procedure sp_deletar_endereco;
call sp_deletar_endereco (47);
select * from tb_endereco; 



DELIMITER //

CREATE PROCEDURE sp_deletar_faixa_etaria(IN cod_faixa_etaria INT)
BEGIN
    DELETE FROM tb_faixa_etaria
    WHERE id_faixa_etaria = cod_faixa_etaria;
END //

DELIMITER ;
drop procedure sp_deletar_faixa_etaria;
call sp_deletar_faixa_etaria (47);
select * from tb_faixa_etaria; 


DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_deletar_filme(IN cod_filme INT)
BEGIN
    DELETE FROM tb_filme
    WHERE id_filme = cod_filme;
END //

DELIMITER ;
drop procedure sp_deletar_filme;
call sp_deletar_filme (47);
select * from tb_filme; 


DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_deletar_funcionario(IN cod_funcionario INT)
BEGIN
    DELETE FROM tb_funcionario
    WHERE id_funcionario = cod_funcionario;
END //

DELIMITER ;
drop procedure sp_deletar_funcionario;
call sp_deletar_funcionario(47);
select * from tb_funcionario; 


DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_deletar_idioma(IN cod_idioma INT)
BEGIN
    DELETE FROM tb_idioma
    WHERE id_idioma = cod_idioma;
END //

DELIMITER ;
drop procedure sp_deletar_idioma;
call sp_deletar_idioma(47);
select * from tb_idioma; 


DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_deletar_pagamento(IN cod_pagamento INT)
BEGIN
    DELETE FROM tb_pagamento
    WHERE id_pagamento = cod_pagamento;
END //

DELIMITER ;
drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 


DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_deletar_pais(IN cod_pais INT)
BEGIN
    DELETE FROM tb_pais
    WHERE id_pais = cod_pais;
END //

DELIMITER ;


drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 


DELIMITER //

CREATE PROCEDURE sp_deletar_perfil(IN cod_perfil INT)
BEGIN
    DELETE FROM tb_perfil
    WHERE id_perfil = cod_perfil;
END //

DELIMITER ;



drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 




DELIMITER //

CREATE PROCEDURE sp_deletar_plano(IN cod_plano INT)
BEGIN
    DELETE FROM tb_plano
    WHERE id_plano = cod_plano;
END //

DELIMITER ;

drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 




DELIMITER //

CREATE PROCEDURE sp_deletar_seriem(IN cod_seriem INT)
BEGIN
    DELETE FROM tb_seriem
    WHERE id_seriem = cod_seriem;
END //

DELIMITER ;


drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 



DELIMITER //

CREATE PROCEDURE sp_deletar_temporada(IN cod_temporada INT)
BEGIN
    DELETE FROM tb_temporada
    WHERE id_temporada = cod_temporada;
END //

DELIMITER ;



drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 


DELIMITER //

CREATE PROCEDURE sp_deletar_tipo_pagamento(IN cod_tipo_pagamento INT)
BEGIN
    DELETE FROM tb_tipo_pagamento
    WHERE id_tipo_pagamento = cod_tipo_pagamento;
END //

DELIMITER ;

drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 





DELIMITER //

CREATE PROCEDURE sp_deletar_usuario(IN cod_usuario INT)
BEGIN
    DELETE FROM tb_usuario
    WHERE id_usuario = cod_usuario;
END //

DELIMITER ;



drop procedure sp_deletar_pagamento;
call sp_deletar_pagamento(47);
select * from tb_pagamento; 



DELIMITER //

CREATE PROCEDURE sp_inserir_ator( cod_nome VARCHAR(50),  cod_sobrenome VARCHAR(50),  
                                   cod_dt_nascimento DATE,  cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
    VALUES (p_nome, p_sobrenome, p_dt_nascimento, p_foto);
END //

DELIMITER ;

CALL sp_inserir_ator('John', 'Doe', '1990-01-01', 'foto');

select * from tb_ator; 


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


DELIMITER //

CREATE PROCEDURE sp_inserir_tipo_pagamento(cod_nome VARCHAR(255))
BEGIN
    INSERT INTO tb_tipo_pagamento (nome)
    VALUES (cod_nome);
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

CREATE PROCEDURE sp_inserir_plano(cod_valor FLOAT(3,2), cod_descricao VARCHAR(255))
BEGIN
    INSERT INTO tb_plano (valor, descricao)
    VALUES (cod_valor, cod_descricao);
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_inserir_perfil(cod_foto VARCHAR(255), cod_nome VARCHAR(255), cod_tipo VARCHAR(255), cod_id_cliente INT)
BEGIN
    INSERT INTO tb_perfil (foto, nome, tipo, id_cliente)
    VALUES (cod_foto, cod_nome, cod_tipo, cod_id_cliente);
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
    INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_tipo_pagamento, id_cliente)
    VALUES (cod_valor, cod_dt_pagamento, cod_id_cartao_credito, cod_id_tipo_pagamento, cod_id_cliente);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_idioma(cod_nome VARCHAR(50))
BEGIN
    INSERT INTO tb_idioma (nome)
    VALUES (cod_nome);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_funcionario(cod_dt_demissao DATE, cod_salario FLOAT(3,2), cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_funcionario (dt_demissao, salario, foto)
    VALUES (cod_dt_demissao, cod_salario, cod_foto);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_filme(cod_oscar VARCHAR(100), cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_filme (oscar, id_catalogo)
    VALUES (cod_oscar, cod_id_catalogo);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_faixa_etaria(cod_idade ENUM('+12', '+14', '+16', '+18'), cod_descricao VARCHAR(100))
BEGIN
    INSERT INTO tb_faixa_etaria (idade, descricao)
    VALUES (cod_idade, cod_descricao);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_endereco(cod_rua VARCHAR(255), cod_quadra VARCHAR(255), 
									cod_bairro VARCHAR(255), cod_cidade VARCHAR(255), 
										    cod_id_pais INT)
BEGIN
    INSERT INTO tb_endereco (rua, quadra, bairro, cidade, id_pais)
    VALUES (cod_rua, cod_quadra, cod_bairro, cod_cidade, cod_id_pais);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_cliente(cod_cpf INT, cod_dt_vencimento DATE, cod_id_plano INT, cod_id_cartao_credito INT)
BEGIN
    INSERT INTO tb_cliente (cpf, dt_vencimento, id_plano, id_cartao_credito)
    VALUES (cod_cpf, cod_dt_vencimento, cod_id_plano, cod_id_cartao_credito);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_idioma(cod_id_catalogo INT, cod_id_idioma INT)
BEGIN
    INSERT INTO tb_catalogo_idioma (id_catalogo, id_idioma)
    VALUES (cod_id_catalogo, cod_id_idioma);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_faixa_etaria(cod_id_faixa_etaria INT, cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_catalogo_faixa_etaria (id_faixa_etaria, id_catalogo)
    VALUES (cod_id_faixa_etaria, cod_id_catalogo);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_inserir_catalogo_ator(cod_id_ator INT, cod_id_catalogo INT)
BEGIN
    INSERT INTO tb_catalogo_ator (id_ator, id_catalogo)
    VALUES (cod_id_ator, cod_id_catalogo);
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

CREATE PROCEDURE sp_inserir_cartao_credito(cod_numero INT, cod_dt_vencimento DATE, cod_cod_seguranca CHAR(8), cod_titular VARCHAR(255))
BEGIN
    INSERT INTO tb_cartao_credito (numero, dt_vencimento, cod_seguranca, titular)
    VALUES (cod_numero, cod_dt_vencimento, cod_cod_seguranca, cod_titular);
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_inserir_ator(cod_nome VARCHAR(50), cod_sobrenome VARCHAR(50), cod_dt_nascimento DATE, cod_foto VARCHAR(255))
BEGIN
    INSERT INTO tb_ator (nome, sobrenome, dt_nascimento, foto)
    VALUES (cod_nome, cod_sobrenome, cod_dt_nascimento, cod_foto);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_atualizar_usuario(cod_id_usuario INT, cod_senha VARCHAR(8), cod_dt_castro DATE, cod_nome VARCHAR(50), cod_sobrenome VARCHAR(50), cod_email VARCHAR(50), cod_atividade TINYINT, cod_dt_nascimento DATE, cod_dt_cadastro DATE, cod_id_cliente INT)
BEGIN
    UPDATE tb_usuario
    SET senha = cod_senha, dt_castro = cod_dt_castro, nome = cod_nome, sobrenome = cod_sobrenome, email = cod_email, atividade = cod_atividade, dt_nascimento = cod_dt_nascimento, dt_cadastro = cod_dt_cadastro, id_cliente = cod_id_cliente
    WHERE id_usuario = cod_id_usuario;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_atualizar_plano(cod_id_plano INT, cod_valor FLOAT(3,2), cod_descricao VARCHAR(255))
BEGIN
    UPDATE tb_plano
    SET valor = cod_valor, descricao = cod_descricao
    WHERE id_plano = cod_id_plano;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_atualizar_perfil(cod_id_perfil INT, cod_foto VARCHAR(255), cod_nome VARCHAR(255), cod_tipo VARCHAR(255), cod_id_cliente INT)
BEGIN
    UPDATE tb_perfil
    SET foto = cod_foto, nome = cod_nome, tipo = cod_tipo, id_cliente = cod_id_cliente
    WHERE id_perfil = cod_id_perfil;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_atualizar_pais(cod_id_pais INT, cod_nome VARCHAR(255), cod_codigo VARCHAR(255))
BEGIN
    UPDATE tb_pais
    SET nome = cod_nome, codigo = cod_codigo
    WHERE id_pais = cod_id_pais;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_atualizar_pagamento(cod_id_pagamento INT, cod_valor FLOAT(3,2), cod_dt_pagamento DATE, cod_id_cartao_credito INT, cod_id_tipo_pagamento INT, cod_id_cliente INT)
BEGIN
    UPDATE tb_pagamento
    SET valor = cod_valor, dt_pagamento = cod_dt_pagamento, id_cartao_credito = cod_id_cartao_credito, id_tipo_pagamento = cod_id_tipo_pagamento, id_cliente = cod_id_cliente
    WHERE id_pagamento = cod_id_pagamento;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_atualizar_idioma(cod_id_idioma INT, cod_nome VARCHAR(50))
BEGIN
    UPDATE tb_idioma
    SET nome = cod_nome
    WHERE id_idioma = cod_id_idioma;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_atualizar_funcionario(cod_id_funcionario INT, cod_dt_demissao DATE, cod_salario FLOAT(3,2), cod_foto VARCHAR(255))
BEGIN
    UPDATE tb_funcionario
    SET dt_demissao = cod_dt_demissao, salario = cod_salario, foto = cod_foto
    WHERE id_funcionario = cod_id_funcionario;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE sp_atualizar_filme(cod_id_filme INT, cod_oscar VARCHAR(100), cod_id_catalogo INT)
BEGIN
    UPDATE tb_filme
    SET oscar = cod_oscar, id_catalogo = cod_id_catalogo
    WHERE id_filme = cod_id_filme;
END //

DELIMITER ;
/*






































