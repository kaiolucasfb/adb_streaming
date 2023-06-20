DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_genero ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# PROFESSOR 

DROP FUNCTION 
DELIMITER // 
CREATE FUNCTION IF NOT EXISTS fn_valida_string(texto VARCHAR(255))
RETURNS BOOLEAN  
READS SQL DATA
 BEGIN
     DECLARE validado BOOLEAN;
     IF length(trim(fn_acento(texto))) <= 2 THEN
        SET validado = FALSE;
	 ELSEIF
          texto IS NULL OR texto = '' then
		SET validado = FALSE;
	 ELSE
        SET validado = TRUE;

RETURN validado;
end if;
END //
DELIMITER ;
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------








DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_artista ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;


DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_disco ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;



DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_gravadora ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;


DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_musica ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;



DELIMITER //
CREATE FUNCTION  fn_validação_de_dados_tipo_artista ( nome VARCHAR(255)) 
RETURNS VARCHAR(255)
begin
INSERT into tb_genero  
      (nome) 
        VALUES  
(fn_acento(nome)); 
RETURN nome;
end//
DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_adcionar_musica
before INSERT 
on tb_disco
for each row 
begin
declare duracao_total TIME;
SET duracao_total = (SELECT (new.duracao + old.duracao) from tb_disco);
UPDATE tb_disco SET id = id_disco; 
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_tempo_total_do_disco
before INSERT 
on tb_disco
for each row 
begin
     UPDATE tb_disco SET duracao = 
 new.duracao > old.duracao 
     where duracao = SEC_TO_TIME
								(TIME_TO_SEC(old.duracao) + TIME_TO_SEC(new.duracao)) 
 AND id = id_disco;
 end//
DELIMITER ;
