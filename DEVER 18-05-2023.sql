USE db_discoteca2;
#COMO criar um sistema de faixa etaria
SELECT 
      nome
      ,dt_nascimento
      ,CASE 
		WHEN (TIMESTAMPDIFF(YEAr, dt_nascimento, CURDATE())) IS NULL THEN '-'
        ELSE (TIMESTAMPDIFF(YEAr, dt_nascimento, CURDATE())) 
        END as idade
      ,CASE
		WHEN (TIMESTAMPDIFF(YEAr, dt_nascimento, CURDATE())) < 18
			THEN 'menor de idade'
	    WHEN (TIMESTAMPDIFF(YEAr, dt_nascimento, CURDATE())) >= 65
            THEN 'idoso'
		WHEN (TIMESTAMPDIFF(YEAr, dt_nascimento, CURDATE())) >= 18
			THEN 'maior de idade'
	ELSE '-'
      END AS 'faixa etaria'
FROM tb_artista;








































DELIMITER //
CREATE PROCEDURE sp_insert_artista (nome_artista VARCHAR (255))
   BEGIN 
       INSERT INTO tb_artista 
            (nome)
		VALUES
            (fn_acento(nome_artista),
		CASE WHEN nome IS NULL THEN '-'
		END);
    END // 
DELIMITER ;
DROP PROCEDURE sp_insert_artista;


use db_discoteca2;





DELIMITER //
CREATE PROCEDURE sp_insert_artista (nome_artista VARCHAR (255))
   BEGIN 
       IF (INSERT INTO tb_artista 
            (nome)
		VALUES
            (fn_acento(nome_artista))) IS NULL
	     THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='insert invalido';
	   END IF;
    END // 
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_insert_artista (nome_artista VARCHAR (255))
   BEGIN 
   IF 
   (nome_artista  IS NULL) OR (LENGTH(TRIM(fn_acento(nome_artista)))) <= 0 
   THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='insert invalido';
       INSERT INTO tb_artista 
            (nome, dt_nascimento, id_tipo_artista)
		VALUES
            (fn_acento(nome_artista), , );
    END IF;
    END  // 
DELIMITER ;
DROP PROCEDURE sp_insert_artista;

CALL sp_insert_artista('John Dè', 2008-01-01, 3);



SELECT * from tb_artista













   DELIMITER //

create procedure sp_insert_artista (nome VARCHAR(255), dt_nascimento date,id_tipo artista INT)
	begin if not exists (nome is NULL) or (LENGTH(TRIM(fn_acento(nome)))) <= 1
	then signal sqlstate '45000' set message_text = 'insert invalido';
    else if insert into tb_artista 
      (nome, dt_nascimento,id_tipo_artista)
    values
      ('joão', 1995-01-01, 4);
 	
     
     end if;
     
	end //
    DELIMITER ;


Drop PROCEDURE sp_insert_artista;



#dever - INSERT, 


use db_discoteca2;
DELIMITER //

#- nomes devem ser inseridos/atualizados sem acentos e não podemos aceitar valores vazios ou nulos
create procedure sp_insert_artista (nome_artista VARCHAR (255)
                                     ,data_nascimento DATE 
                                     ,cod_tipo_artista INT)
begin
	if not exists(select id from tb_tipo_artista where id = cod_tipo_artista) then  # se vc tem uma constraint vc tem q validar as constraints 
	   signal sqlstate '45000' set message_text = 'tipo de artista não encontrado'; # customização do sinal RED
	elseif                                                                          #ELSEIF e ELSE TEM DIFERENÇA, o elseif serve pra continuar no proximo codigo de comparação
	  (data_nascimento > curdate()) or data_nascimento is null then                      # aqui n aceita datas futuras ou valores nulos
	   signal sqlstate '45000' set message_text = 'data de nascimento invalida';
    elseif   
        (nome_artista is null) or (length(trim(fn_acento(nome_artista)))) <= 2 	then 
	   signal sqlstate '45000' set message_text = 'nome informado e invalido';
	 else insert into tb_artista (nome                                              # ELSE sozinho serve pra apenas continuar o proximo codigo
                                  ,dt_nascimento
                                  ,id_tipo_artista)             
	      values (fn_acento(nome_artista)
	             ,data_nascimento  
	             ,cod_tipo_artista);
									
end if ;
end //

delimiter ;
call sp_insert_artista('LUCIANO lopes', '1993-09-09',1);

select * from tb_artista;



# datas não podem ser futuras ------------------------------------------------------------------------------------------------------------------------------------



delimiter //

create procedure sp_update_artista (nome_artista VARCHAR (255)
                                     ,data_nascimento DATE 
                                     ,cod_tipo_artista INT)
begin
	if not exists(select id from tb_tipo_artista where id = cod_tipo_artista) then  
	   signal sqlstate '45000' set message_text = 'tipo de artista não encontrado'; 
	elseif                                                                          
	  (data_nascimento > curdate()) or data_nascimento is null then                      
	   signal sqlstate '45000' set message_text = 'data de nascimento invalida';
    elseif   
        (nome_artista is null) or (length(trim(fn_acento(nome_artista)))) <= 2 	then 
	   signal sqlstate '45000' set message_text = 'nome informado e invalido';
    elseif
        NOT EXISTS (SELECT id FROM tb_artista WHERE id = cod_artista) THEN
        signal sqlstate '45000' set message_text = 'data de nascimento invalida';
    else 
    UPDATE tb_artista SET
       nome = fn_acento(nome_artista),
       dt_nascimento = data_nascimento,
       id_tipo_artista = cod_tipo_artista
       WHERE id =cod_artista;
end if ;
end //

delimiter ;

#TEMPOS NÃO PODEM SER NEGATIVOS 




