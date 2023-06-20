#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# rotina (um dos nomes de procedure) são funções que usam direto no dia a dia, por isso precisam ser salvos e de fácil acésso



                                                                  #BASE DE CRIAÇÃO DE PROCEDURE
                                                                  
                                                                  
DELIMITER //
CREATE PROCEDURE sp_insert_filho(
	nome_filho VARCHAR(255),
    cod_mae INT,
    cod_pai INT)
BEGIN
	IF NOT EXISTS(SELECT id FROM tb_mae WHERE id =  cod_mae) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'codigo de mãe invalido';
	ELSEIF
		NOT EXISTS(SELECT id FROM tb_pai WHERE id =  cod_pai) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'codigo de pai invalido';
	ELSEIF
		(nome_filho IS NULL) OR (length(trim(fn_remove_acento(nome_filho)))) <=0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'nome de filho invalido';
	ELSE
		INSERT INTO tb_filho (nome, id_pai, id_mae) VALUES (fn_remove_acento(nome_filho), cod_mae, cod_pai);
	END IF ;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE sp_pai_filho2(cod_pai INT)
begin 
   select p.id,                                  #procedures não precisam de reads sql data/deterministc
		  p.nome,                                #procedures não tem retorno, só ativa o cod q vc ultilizou dentro da procedure
          f.nome
		FROM tb_filho f 
           INNER JOIN tb_pai p 
              ON p.id = f.id_pai
		    WHERE p.id = cod_pai;
END //
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_insert_pai(nome_pai VARCHAR(255))   #numa situação real voce tem que verificar se o numero de dados é conrespondete a construção ( no caso o 255 ta igual)

INSERT INTO tb_pai                                      #todas os 4 tipos de quarys primarias podem ser ultilizadas dentro de uma quary
            (nome)                       
	VALUES (nome_pai);                                  #se for apenas um codigo voce não precisa de delimiter/begin/end
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_insert_mae (nome_mae VARCHAR(255))
   BEGIN 
       INSERT INTO tb_mae
           (nome)
		VALUES 
           (nome_mae);
	END // 
DELIMITER ;

DROP PROCEDURE sp_info_mae;


CALL sp_insert_mae('crys');                     # pra ativar as procedure voce usa CALL
SELECT nome FROM tb_mae;                        #sempre verifique o dado em questão q voce alterou/inseriu/deletou/filtrou 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_delete_mae (id_mae INT)
   BEGIN 
 DELETE FROM tb_mae WHERE id = id_mae;
	END // 
DELIMITER ;

CALL sp_delete_mae (200);
SELECT * FROM tb_mae;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Crie para cada tabela do banco db_discoteca uma procedure que realize seus inserts, delete, update, porém todos os inserts já devem ser feitos no banco sem acentuação.
USE db_discoteca2;

                                              
                                                               #TB_ARTISTA
#----------------------------------------------------------------------------------------------- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_artista (nome_artista VARCHAR (255))
   BEGIN 
       INSERT INTO tb_artista 
            (nome)
		VALUES
            (fn_acento(nome_artista));
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_artista (id_artista INT)
   BEGIN 
DELETE FROM tb_artista WHERE id = id_artista;
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_artista (id_artista INT, nome_artista VARCHAR (255), cod_nascimento DATE, cod_tipo_artista INT)
BEGIN 
       UPDATE tb_artista SET nome = fn_acento(nome_artista), 
                             dt_nascimento = cod_nascimento, 
							 id_tipo_artista =  cod_tipo_artista
       WHERE id = id_artista; 
END // 
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                 #TB_DISCO
#-----------------------------------------------------------------------------------------------INSERT                                       
DELIMITER //
CREATE PROCEDURE sp_insert_disco (titulo_disco VARCHAR(255), cod_duracao TIME, cod_lancamento YEAR,cod_artista INT, cod_gravadora INT, cod_genero INT)
BEGIN 
       INSERT INTO tb_disco 
            (titulo, duracao, ano_lancamento, id_artista, id_gravadora, id_genero)
		VALUES
            (fn_acento(titulo_disco),
            cod_duracao,
            cod_lancamento,
            cod_artista,
            cod_gravadora,
            cod_genero);
END // 
DELIMITER ;        

CALL sp_insert_disco('lúcìcânõ Fitn^s', '03:00:00',1993,1,14,10);                                              
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //

CREATE PROCEDURE sp_delete_disco (id_disco INT)
BEGIN 
    DELETE FROM tb_disco WHERE id = id_disco;
END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE

DELIMITER //
CREATE PROCEDURE sp_update_disco (id_disco INT, titulo_disco VARCHAR(255), 
                                  cod_duracao TIME, cod_lancamento YEAR,
								  cod_artista INT, cod_gravadora INT, cod_genero INT)
   BEGIN 
       UPDATE tb_disco SET titulo = fn_acento(titulo_disco), 
						   duracao = cod_duracao, 
                           ano_lancamento = cod_lancamento,
                           id_artista = cod_artista,
                           id_gravadora = cod_gravadora,
                           id_genero = cod_genero
       WHERE id = id_disco; 
    END // 
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																			#tb_genero 
                                                                            
                                                                            
  #----------------------------------------------------------------------------------------------- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_genero (nome_genero VARCHAR (255))
   BEGIN 
       INSERT INTO tb_genero
            (nome)
		VALUES
            (fn_acento(nome_genero));
    END // 
DELIMITER ;      
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_genero (id_genero INT)
   BEGIN 
DELETE FROM tb_genero WHERE id = id_genero;
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_genero (id_genero INT, nome_genero VARCHAR (255))
   BEGIN 
       UPDATE tb_genero SET nome = fn_acento(nome_genero), 
                            id = id_genero 
       WHERE id = id_genero; 
    END // 
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                                                        #tb_gravadora
                                                                        
                                                                        
#----------------------------------------------------------------------------------------------- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_gravadora (nome_gravadora VARCHAR (255))
   BEGIN 
       INSERT INTO tb_gravadora
            (nome)
		VALUES
            (fn_acento(nome_gravadora));
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_gravadora (id_gravadora INT)
   BEGIN 
DELETE FROM tb_gravadora WHERE id = id_gravadora;
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_gravadora (cod_gravadora INT, nome_gravadora VARCHAR (255))
   BEGIN 
       UPDATE tb_gravadora SET nome = fn_acento(nome_gravadora), 
                               cod_gravadora = id
       WHERE id = id_gravadora; 
    END // 
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
           
                                                             #tb_musica
#----------------------------------------------------------------------------------------------- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_musica (nome_musica VARCHAR (255))
   BEGIN 
       INSERT INTO tb_musica
            (nome)
		VALUES
            (fn_acento(nome_musica));
    END // 
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_musica (id_musica INT)
   BEGIN 
DELETE FROM tb_musica WHERE id = id_musica;
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_musica (id_musica INT, nome_musica VARCHAR (255), cod_duracao TIME, cod_disco INT)
   BEGIN 
       UPDATE tb_musica SET nome = fn_acento(nome_musica),
						    nome = nome_musica,
                            duracao = cod_duracao,
                            id_disco = cod_disco
       WHERE id = id_musica;
                   
    END //  
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                        #tb_tipo_artista
#----------------------------------------------------------------------------------------------- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_tipo_artista (nome_tipo_artista VARCHAR (255))
   BEGIN 
       INSERT INTO tb_tipo_artista
            (nome)
		VALUES
            (fn_acento(nome_tipo_artista));
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_tipo_artista  (id_tipo_artista  INT)
   BEGIN 
DELETE FROM tb_tipo_artista  WHERE id = tipo_artista ;
    END // 
DELIMITER ;
#----------------------------------------------------------------------------------------------- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_tipo_artista (id_tipo_artista INT, cod_nome VARCHAR(255))
   BEGIN 
UPDATE tb_tipo_artista SET id = id_tipo_artista,
                           nome = cod_nome;
    END // 
DELIMITER ;





















































































































































































