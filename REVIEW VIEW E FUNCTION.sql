



-- vw_gravadora - deve conter id, nome e total de discos


CREATE VIEW vw_gravadora_inf AS
SELECT 
      count(id_gravadora) as gravadora_id, 
	  g.nome as nome_da_gravadora, 
      d.titulo as titulo_dos_disco, 
      d.id as id_disco
FROM  tb_gravadora g
INNER JOIN tb_disco d
ON g.id = d.id; 

DROP VIEW vw_gravadora_inf;

-- PROFESSOR 

SELECT 
g.id,
g.nome,
     COUNT(d.id_gravadora) as qtd_disco_por_gravadora
FROM tb_disco d 
INNER JOIN tb_gravadora g
   ON d.id_gravadora = g.id 
GROUP BY d.id_gravadora;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- vw_disco - deve conter todos os dados do disco, porem as fks devem ser substituidas pelo nome do item que a mesma representa

use  db_discoteca2;

CREATE VIEW vw_gravadoras_dados AS
SELECT 
	  d.id as id_disco,
      d.titulo as titulo,
      d.duracao as duracao_do_disco,
      d.ano_lancamento as criacao, 
      a.nome as artista_nome,
      g.id as id_da_gravadora,
      g.nome as nome_da_gravadora
FROM tb_disco as d
INNER JOIN tb_artista as a
        ON a.id = d.id_artista 
INNER JOIN tb_gravadora as g
		ON g.id = d.id_gravadora ;



-- PROFESSOR 
CREATE VIEW vw_disco AS SELECT 
    d.id
   ,d.titulo as disco
   ,d.ano_lancamento
   ,d.duracao
   ,a.nome as artista
   ,g.nome as gravadora
   ,ge.nome as genero
FROM tb_disco as d
INNER JOIN tb_gravadora g 
        ON d.id_gravadora = g.id
INNER JOIN tb_artista as a 
        ON  d.id_artista = a.id
INNER JOIN tb_genero as ge 
        ON  d.id_genero = ge.id;

SELECT artista, disco FROM vw_disco;





-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- vw_artista - deve conter id, nome completo, idade, total de discos




CREATE VIEW vw_artista_disco AS SELECT 
         a.id id_artista,
         a.nome nome_artista,
         d.titulo as disco, 
		 TIMESTAMPDIFF(YEAR, a.dt_nascimento, '2023-01-01' ) AS idade
FROM tb_artista AS a
INNER JOIN tb_disco as d
ON d.id = a.id
WHERE dt_nascimento <> '0000-00-00';

-- PROFESSOR 

 ALTER VIEW vw_artista AS SELECT 
	  a.id
      ,a.nome as artista
      ,TIMESTAMPDIFF(YEAR, a.dt_nascimento, CURDATE()) AS idade
	  ,COUNT(d.id_artista) as quantidade_discos
	  ,ta.nome as tipo
FROM tb_disco as d
INNER JOIN tb_artista as a 
ON a.id = d.id_artista
INNER JOIN tb_tipo_artista as ta
ON ta.id = a.id_tipo_artista
GROUP BY d.id_artista;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- vw_musicas - deve conter nome da musica, duração, o disco e o artista.


CREATE VIEW vw_musicas_info AS SELECT 
       m.nome as nome_da_musica,
       m.duracao as duração_da_musica,
       a.nome AS nome_do_artista,
       d.titulo AS nome_do_disco
FROM
        tb_musica AS m 
INNER JOIN tb_disco as d
ON d.id = m.id
INNER JOIN tb_artista as a 
ON d.id = a.id;


-- PROFESSOR 
SELECT
     m.nome as musica
     ,m.duracao
     ,d.titulo as disco
     ,a.nome as artista 
FROM tb_musica as m
INNER JOIN tb_disco as d
ON d.id = m.id_disco
INNER JOIN tb_artista as a
ON d.id_artista = a.id;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Crie uma function que ao receber o codigo de um disco nos diga qual o tempo total desse disco Usando a tabela musica.


DELIMITER //
CREATE FUNCTION fn_tempo_disco (id_disco INT)
RETURNS  VARCHAR(255)
READS SQL DATA
    BEGIN 
DECLARE tempo_disco VARCHAR(255);
SET tempo_disco = ( 
SELECT CONCAT(
    ' id do disco ',  d.id ,
    ' titulo_do_disco ', d.titulo,
   ' duração_das_musicas ', d.duracao  )
FROM tb_disco AS d
INNER JOIN tb_musica AS m
ON    d.id = m.id);
RETURN tempo_disco;
END // 

DELIMITER ;

-- professor 

DELIMITER // 

CREATE FUNCTION fn_dados_disco(cod_disco INT)
RETURNS VARCHAR TIME 
READS SQL DATA 
BEGIN -- SO PRECISA SER USADO SE TIVER  MAIS DE UM BLOCO DE DADOS FECHADOS COM ;
DECLARE tempo_total TIME 
set tempo_total = (SELECT 
                        SEC_TO_TIME(SUM(TIME_TO_SEC(duracao)))
                   FROM tb_musica
                   WHERE id = cod_disco); 
RETURN tempo_total; 
END
DELIMITER ;

DROP FUNCTION fn_tempo_disco;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Crie uma function que ao receber o codigo de um disco nos diga todas as informações desse disco.

DELIMITER //
CREATE FUNCTION fn_duracao_disco (id_disco INT)
RETURNS INT 
DETERMINISTIC 
    BEGIN 
DECLARE info_disco INT;
SET info_disco = (
SELECT CONCAT(' id_do_disco ', d.id, 
              ' titulo do disco ', d.titulo,
              ' duração da musica ', d.duracao,
              ' ano de lançamento do disco ', DATE_FORMAT(d.ano_lancamento,'%d/%m/%Y' ))
FROM tb_disco as d);
RETURN info_disco;
END // 
DELIMITER ;


-- PROFESSOR

DELIMITER //

CREATE FUNCTION fn_dados_disco (id_disco INT) 
RETURNS VARCHAR (255)
READS SQL DATA
BEGIN
  DECLARE informacoes VARCHAR (255)
  SET informacoes = (SELECT CONCAT(id, ' ', 
                                   disco, ' ', 
                                   duracao, ' ', 
                                   ano_lancamento, ' ', 
                                   artista, ' ' , 
                                   genero, ' ' , 
                                   gravadora) 
FROM vw_disco
WHERE id = id_disco);
                           
RETURN informacoes; 
END//



SELECT fn_dados_disco(7);




DELIMITER ;
SELECT fn_dados_disco(7);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1 -  crie uma view que mostre o id e nome do filho, nome do pai e nome da mae, porém somente dos que estão relacionados. Apos criada a view utiliezea em uma function que me premiter visualizar esses dados de um filho expecifico.

USE db_familia;


DELIMITER // 


CREATE VIEW vw_familia_info AS SELECT
     p.id as id_pai,
	 m.id as id_mãe,
     p.nome as nome_pai,
     m.nome as nome_mae,
     f.nome as nome_filho
FROM tb_filho AS f 
INNER JOIN tb_pai as p 
ON f.id_pai = p.id
INNER JOIN tb_mae as m 
ON f.id_mae = m.id;



DELIMITER ;
DROP VIEW vw_familia_info;

DELIMITER //
CREATE FUNCTION fn_familia_info (id_filho INT)
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE familia_info INT;
SET familia_info = (SELECT CONCAT(' o pai ',nome_pai,', a mae ', nome_mae,', o filho ', nome_filho) FROM vw_familia_info);
RETURN familia_info;
END // 
DELIMITER ;


-- PROFESSOR
USE  db_familia;
CREATE VIEW vw_familia AS SELECT   
     f.id
     ,f.nome as nome_do_filho
     ,p.nome as nome_do_pai
     ,m.nome as nome_da_mae
FROM tb_filho f 
    INNER JOIN  tb_pai p 
        ON f.id_pai = p.id
	INNER JOIN tb_mae m
         ON f.id_mae = m.id;
         
delimiter // 
CREATE FUNCTION IF NOT EXISTS fn_info_filho (cod_filho INT)         
RETURNS VARCHAR (255) 
READS SQL DATA 
BEGIN 
DECLARE dados_familia VARCHAR(255); --  dados VARCHAR(255); -- vc pode declarar varios declares, mas, cada linha tem q ter tipos unicos 

SET dados_familia = (SELECT 
					CONCAT('codigo_filho:  ', id, 'filho: '
                           ,filho, ' pai '
                           ,pai, ' mãe: '
                           ,mae)
						FROM vw_familia 
                        WHERE id = cod_filho);
   RETURN dados_familia;

END //

DELIMITER ;





-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2 - Ainda usando o db_familia, crie uma view que mostre o id e nome dos pais, o nome do filho, desejasse visualisar todos os pais, mesmo os que não possuem filhos. crie uma functions que me permita visualizar esses dados pelo nome do pai.




CREATE VIEW vw_familia_dados AS SELECT
p.id as id_pai,
m.id as id_mae,
p.nome as pai,
m.nome as mae,
f.nome as filho
FROM tb_filho as f
INNER JOIN tb_pai as p
ON f.id_pai = p.id 
INNER JOIN tb_mae as m 
ON f.id_mae = m.id;


-- PROFESSOR
CREATE VIEW vw_info_familiares AS
SELECT   
     f.id  ,f.nome as nome_do_filho  ,p.nome as nome_do_pai  ,m.nome as nome_da_mae
FROM tb_filho f 
    left JOIN  tb_pai p 
        ON f.id_pai = p.id
	RIGHT JOIN tb_mae m
         ON f.id_mae = m.id
    union     
    
    SELECT   
     f.id ,  f.nome as nome_do_filho  ,  p.nome as nome_do_pai  ,  m.nome as nome_da_mae
FROM tb_filho f 
    left JOIN  tb_pai p 
        ON f.id_pai = p.id
	left JOIN tb_mae m
         ON f.id_mae = m.id;
         

         
delimiter // 
CREATE FUNCTION IF NOT EXISTS fn_info_familia (nome_pai VARCHAR(255))         
RETURNS VARCHAR (255)
READS SQL DATA 
BEGIN 
DECLARE dados_familia VARCHAR(255); --  dados VARCHAR(255); -- vc pode declarar varios declares, mas, cada linha tem q ter tipos unicos 

SET dados_familia = (SELECT 
                     CONCAT( 'codigo_filho:  ', id, 'filho: '
                           ,filho, ' pai '
                           ,pai, ' mãe: '
                           ,mae)
						FROM vw_familiares
                        WHERE UPPER(pai) = UPPER(nome_pai));
   RETURN dados_familia;

END //

DELIMITER ;

drop function fn_info_familia;
SELECT fn_info_familia ('naruto');
-- 3 - Usando o db_discoteca, crie uma view que me permita visualisar todos os dados do disco, junto ao nome da gravadora e nome do artista.


USE db_discoteca2;



SELECT  
	  d.id, 
      d.titulo, 
      d.duracao, 
      d.ano_lancamento, 
      gr.nome
FROM tb_disco as d
INNER JOIN tb_gravadora as gr
ON d.id_gravadora = d.id
INNER JOIN tb_artista 
on d.id_artista = d.id;

-- PROFESSOR



USE db_discoteca2;
CREATE VIEW vw_disco_gravadora_artista AS 
SELECT 
    d.id
   ,d.titulo as disco
   ,d.ano_lancamento
   ,d.duracao
   ,a.nome as artista
   ,g.nome as gravadora
   ,ta.nome as categoria
FROM tb_disco as d
INNER JOIN tb_gravadora g 
        ON d.id_gravadora = g.id
INNER JOIN tb_artista as a 
        ON  d.id_artista = a.id
INNER JOIN tb_tipo_artista as ta
        ON  ta.id = a.id_tipo_artista;


-- 4 - Ainda usando o discoteca, crie uma function que remova os acentos de qualquer letra, seja ela maiuscula ou minuscula.
DELIMITER // 
CREATE FUNCTION IF NOT EXISTS fm_remove_acento(texto VARCHAR(255))
RETURNS VARCHAR (255)
DETERMINISTIC
BEGIN

			set texto   = REPLACE(texto,'a', 'Ã'),
				texto   = REPLACE(texto,'á', 'Á'),
				texto   = REPLACE(texto,'à', 'à'),
				texto  = REPLACE(texto,'â', 'Â');
			    texto   = REPLACE(texto,'a', 'Ã'),
				texto   = REPLACE(texto,'á', 'Á'),
				texto   = REPLACE(texto,'à', 'à'),
				texto  = REPLACE(texto,'â', 'Â');			
				texto   = REPLACE(texto,'á', 'Á'),
				texto   = REPLACE(texto,'à', 'à'),
				texto  = REPLACE(texto,'â', 'Â');


END //
DELIMITER ;




-- 5 - Mostre todos o nome de todos os artistas e discos, mesmo os que não possuem relacionamentoS


SELECT 
      d.id
      ,d.titulo 
      ,a.id
      ,a.nome
FROM tb_disco as d 
 RIGHT JOIN tb_artista as a
ON d.id_artista = d.id
LEFT  JOIN tb_disco 
ON d.id_artista = d.id;

#professor 

SELECT 
    d.titulo as disco
   ,a.nome as artista

FROM tb_disco as d

LEFT JOIN tb_artista as a 
     
     ON  d.id_artista = a.id

UNION
select    d.titulo as disco
          ,a.nome as artista
FROM tb_disco as d
RIGHT JOIN tb_artista as a 
ON a.id = d.id_artista;





#6 Crie uma função que deixe todos os caracteres de uma string maiusculas.


DELIMITER //
CREATE FUNCTION IF NOT EXISTS fn_maiuscula(texto VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN 
			SET texto   = REPLACE(texto,'a', 'A'),
				texto   = REPLACE(texto,'b', 'B'),
				texto   = REPLACE(texto,'c', 'C'),
				texto   = REPLACE(texto,'d', 'D'),
				texto   = REPLACE(texto,'e', 'E'),
				texto   = REPLACE(texto,'f', 'F'),
				texto   = REPLACE(texto,'g', 'G'),
				texto   = REPLACE(texto,'h', 'H'),
				texto   = REPLACE(texto,'i', 'I'),
				texto   = REPLACE(texto,'j', 'J'),
				texto   = REPLACE(texto,'k', 'K'),
				texto   = REPLACE(texto,'l', 'L'),
				texto   = REPLACE(texto,'m', 'M'),
				texto   = REPLACE(texto,'n', 'N'),
				texto   = REPLACE(texto,'o', 'O'),
				texto   = REPLACE(texto,'q', 'Q'),
				texto   = REPLACE(texto,'r', 'R'),
				texto   = REPLACE(texto,'s', 'S'),
				texto   = REPLACE(texto,'t', 'T'),
				texto   = REPLACE(texto,'u', 'U'),
				texto   = REPLACE(texto,'v', 'V'),
				texto   = REPLACE(texto,'w', 'W'),
				texto   = REPLACE(texto,'y', 'Y'),
				texto   = REPLACE(texto,'z', 'Z'),
				texto   = REPLACE(texto,'a', 'Ã'),
				texto   = REPLACE(texto,'á', 'Á'),
				texto   = REPLACE(texto,'à', 'à'),
				texto  = REPLACE(texto,'â', 'Â');
                RETURN texto;

END // 
DELIMITER ;
SELECT fn_maiuscula ('jksbdvjsdbvlsdbvçsdhvbldshvçsj');




#7 Crie uma função que deixe todos os caracteres de uma string minusculas.


DELIMITER //
CREATE FUNCTION IF NOT EXISTS fn_manuscula(texto VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN              
			SET texto = REPLACE(texto,'A', 'a'),
				texto = REPLACE(texto,'B', 'b'),
				texto = REPLACE(texto,'C', 'c'),
				texto = REPLACE(texto,'D', 'd'),
				texto = REPLACE(texto,'E', 'e'),
				texto = REPLACE(texto,'F', 'f'),
				texto = REPLACE(texto,'G', 'g'),
				texto = REPLACE(texto,'H', 'h'),
				texto = REPLACE(texto,'I', 'i'),
				texto = REPLACE(texto,'J', 'j'),
				texto = REPLACE(texto,'K', 'k'),
				texto = REPLACE(texto,'L', 'l'),
				texto = REPLACE(texto,'M', 'm'),
				texto = REPLACE(texto,'N', 'n'),
				texto = REPLACE(texto,'O', 'o'),
				texto = REPLACE(texto,'Q', 'q'),
				texto = REPLACE(texto,'R', 'r'),
				texto = REPLACE(texto,'S', 's'),
				texto = REPLACE(texto,'T', 't'),
				texto = REPLACE(texto,'U', 'u'),
				texto = REPLACE(texto,'V', 'v'),
				texto = REPLACE(texto,'W', 'w'),
				texto = REPLACE(texto,'Y', 'y'),
				texto = REPLACE(texto,'Z', 'z'),
				texto = REPLACE(texto,'Ã', 'a'),
				texto = REPLACE(texto,'Á', 'á'),
				texto = REPLACE(texto,'à', 'à'),
				texto = REPLACE(texto,'Â', 'â');
                RETURN texto;

END // 
DELIMITER ;






# 8 Crie uma função que ao ser chamada receba o codigo de um pai e me motra seus dados e quais são seus filhos.



USE db_familia;


delimiter // 
CREATE FUNCTION IF NOT EXISTS fn_info_pai (cod_pai INT)         
RETURNS VARCHAR (255)
READS SQL DATA 
BEGIN 
DECLARE dados_familia VARCHAR(255); --  dados VARCHAR(255); -- vc pode declarar varios declares, mas, cada linha tem q ter tipos unicos 

SET dados_familia = (SELECT 
                     CONCAT('/codigo do pai: ', p.id, 
							'/Nome do pai: ', p.nome,
                            ' /filho: ', f.nome)
						FROM tb_filho f
                          INNER JOIN tb_pai p
                          ON p.id = f.id_pai 
                        WHERE p.id = cod_pai);
   RETURN dados_familia;

END //

DELIMITER ;





SELECT fn_info_pai(3);
DROP FUNCTION fn_info_pai;










DELIMITER // 
CREATE PROCEDURE sp_pai_filho2(cod_pai INT)
begin 
   select p.id,
		  p.nome,
          f.nome
		FROM tb_filho f 
           INNER JOIN tb_pai p 
              ON p.id = f.id_pai
		    WHERE p.id = cod_pai;

END //
DELIMITER ;



































































































