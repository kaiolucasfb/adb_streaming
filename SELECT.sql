SELECT 
	   db_discoteca2.tb_musica.nome AS musica, 
	   db_discoteca2.tb_musica.duracao AS tempo

FROM db_discoteca2.tb_musica LIMIT 10;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
	c.nome AS console, j.nome AS jogo 
FROM
      db_game.tb_console AS c, 
      db_game.tb_jogo AS j;
DESCRIBE 
	  db_game.tb_console;      
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE db_discoteca2;

SELECT * FROM tb_artista
WHERE id = 1000;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_tipo_artista;

SELECT * FROM tb_artista
WHERE dt_nascimento = '2001-11-02'; -- = significa q vai procurar todos os codigos em IGUALDADE a 2001-11-02
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_artista
 WHERE dt_nascimento <> '0000-00-00'; -- = <> significa q vai diferenciar todos os condigos DIFERENTES de 0000-00-00
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE tb_artista SET id_tipo_artista = 2 -- construção de UPDATE 
 WHERE dt_nascimento <> '0000-00-00';
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_artista
 WHERE id IN (10, 100); -- o IN serve para mostrar UNICAMENTE o 10 e 100
 
 SELECT * FROM tb_artista
 WHERE id IN ('1993-09-09', '1997-09-23');
 -- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_artista
 WHERE id_tipo_artista = 2 OR -- o OR = OU serve para diferenciar em caso de comparação, aparece em caso de um ou mais ids for verdadeiros 
	   id_tipo_artista = 3;
       
SELECT * FROM tb_artista
 WHERE id_tipo_artista = 2 OR 
	   dt_nascimento >= '2000-01-01';
 -- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_musica 
WHERE duracao >= '00:03:00' AND 
	  duracao <= '00:05:00'
LIMIT 1000;

SELECT * FROM tb_musica 
WHERE duracao BETWEEN '00:03:00' AND -- BETWEEN = entre, vc escolhe dois valores e o between mostra os dados entre eles
	   '00:05:00'
LIMIT 1000;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM tb_musica 
WHERE(duracao BETWEEN '00:03:00' AND '00:05:00') OR -- a regra dos parenteses e a mesma da matematica normal 
	 (duracao BETWEEN '00:09:00' AND '00:12:00')
LIMIT 1000;
	
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tb_musica 
WHERE nome LIKE 'jin%' -- o LIKE = PROCURAR por algo parecido \\ a % especifica q eu so sei até aquele dado1 ,e vai procurar todos os dados com dado1, se colocar antes, e o começo do dado, se colocar depois, e o final do dado

LIMIT 1000;

SELECT * FROM tb_musica 
WHERE id LIKE '%5'; -- aqui a % procurou os ID que tinham 5 NO FINAL do dado 
 
 SELECT * FROM tb_musica 
WHERE nome LIKE '%J%'; -- aqui ele fez uma varredura TOTAL de todos os dados q tenham J

 SELECT * FROM tb_musica 
WHERE nome LIKE '_a%'; -- aqui o _ ta falando q eu n sei qual o PRIMEIRO DADO, e q a varredura vai ser feito apenas do segundo dado(a) em diante 

 SELECT * FROM tb_musica 
WHERE nome LIKE '%a__'; -- aqui ele ta procurando os dados que, primeiro seja aleatorio, o segundo dado obrigatoriamente (a) e os anderlines servem pra delimitar o tanto de caracteres do dado em questão

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT * FROM tb_musica 
WHERE duracao NOT BETWEEN '00:06:00' AND '00:09:00' -- o NOT serve para NEGAR dados 
LIMIT 1000;

 SELECT * FROM tb_musica 
WHERE NOT(duracao >= '00:06:00' AND duracao <='00:09:00'); -- forma de escrita sem o NOT BETWEEN 

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT id_musica, nome, duracao -- ordem de atributos 
FROM tb_musica -- FROM serve pra escolher uma entidade, 
ORDER BY nome  -- ORDER BY serve pra vc ORDERNAR por onde vc puxa um atributo primeiro 
LIMIT 10000;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT id_musica,nome, duracao
FROM tb_musica -- FROM serve pra escolher uma entidade, 
order by duracao DESC -- DESC serve para deixar em ordem descendente 
LIMIT 10000;

SELECT 
    id_musica, nome, duracao
FROM tb_musica  -- FROM serve pra escolher uma entidade, 
ORDER BY duracao ASC  -- DESC serve para deixar em ordem ascendente 
LIMIT 10000;

 SELECT DISTINCT  nome, duracao -- DISTINCT serve para vc n deixar os valores misturados (e se for usado com o ID da construção, ele não funciona)
FROM tb_musica   
ORDER BY duracao DESC, nome ASC -- aqui ele usou a duração DESCENDENTE, e o nome ASCENDENTE (alfabetico)   
LIMIT 10000;

 SELECT DISTINCT  nome, duracao -- DISTINCT serve para vc n deixar os valores misturados (e se for usado com o ID da construção, ele não funciona)
FROM tb_musica   
ORDER BY nome ASC, duracao DESC  -- aqui ele deixou o nome ASCENDENTE (Qalfabetico) e depois a duração DESC (menor tempo
LIMIT 10000;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE db_discoteca2;

SELECT * FROM tb_disco;

SELECT MAX(ano_lancamento), MAX(titulo) FROM tb_disco; -- O MAX tira um maior valor numerico de um coluna 


SELECT MIN(ano_lancamento), MIN(duracao) FROM tb_disco; -- O MIN tira o menor valor numerico de uma coluna


SELECT AVG(duracao)FROM tb_disco; -- tira a MEDIA da coluna numerica

SELECT 
       AVG(ano_lancamento) AS media, -- tira a MEDIA da coluna numerica
	   MIN(ano_lancamento) AS minimo, -- tira a MINIMA da coluna numerica
       MAX(ano_lancamento) AS maximo -- tira a MAXIMA  da coluna numerica
FROM tb_disco;


SELECT SUM(duracao)FROM tb_disco; -- O SUM serve para SOMAR os valores no total 


SELECT COUNT(ano_lancamento) FROM tb_disco; -- O COUNT serve para contar o tanto de dados q tem em uma coluna
SELECT COUNT(4) FROM tb_disco; -- se voce colocar o numero da COLUNA na CONSTRUÇÃO DA TABELA (mostra no canto esquerdo se vc clicar na columns q voce quer)

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE db_game;


SELECT * FROM tb_console WHERE id_console = 1;

SELECT * FROM tb_jogo WHERE id_jogo = 3; -- forma pratica de puxar um id unico 

SELECT DISTINCT id_jogo  -- o DISCTINT pega apenas um dado dos iguais e te mostra 
      from tb_jogo_console;


SELECT 
    id_jogo, COUNT(id_jogo)
FROM
    tb_jogo_console
GROUP BY id_jogo; -- o GROUP BY pega um grupo de dados iguais e te mostra

SELECT id_console, COUNT(id_console) AS quantidade_jogos  -- forma de descobrir a quantidade de descobrir a contagem dentro de um grupo 
FROM tb_jogo_console GROUP BY id_console;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE db_discoteca2;


SELECT ano_lancamento, COUNT(ano_lancamento) AS 'quantidade disco' -- count serve pra contar o total de dados dentro de um 
FROM tb_disco 
GROUP BY ano_lancamento; -- forma de descobrir a quantidade de descobrir a contagem dentro de um grupo 


SELECT  ano_lancamento, COUNT(ano_lancamento) AS quantidade
FROM tb_disco 
GROUP BY ano_lancamento
HAVING quantidade  > 5000; -- O HAVING serve para FILTRAR APENAS os grupos, impondo um limite (ali eu procurei os maiores de 5000)


SELECT  ano_lancamento, COUNT(ano_lancamento) AS quantidade
FROM tb_disco 
WHERE ano_lancamento BETWEEN 2000 AND 2020 -- o WHERE sempre vem depois do FROM
GROUP BY ano_lancamento -- o GROUP BY vem DEPOIS do from 
HAVING quantidade  > 5000 -- filtrou os dados do GRUOP BY acima de 5000 
ORDER BY quantidade DESC; -- aqui ordenou os dados filtrados do GROUP BY em forma decrescente 

-- quero saber quantas musicas cada disco tem, mas somente dos discos acima de 100 e abaixo de 500 ordenado de forma decrescente de quantidade, apenas os discos de 1000 a 1999

SELECT id_disco, COUNT(id_disco) AS qtd
FROM tb_musica 
WHERE id_disco BETWEEN 1 AND 100000 
GROUP BY id_disco 
HAVING qtd BETWEEN 101 and 1000 
ORDER BY qtd ASC;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------




SELECT now(); -- traz a data e a hora q voce executou uma função

SELECT curdate(); -- traz apenas a data

SELECT curtime(); -- traz apenas a hora

SELECT current_timestamp(); -- traz a data e a hora filtrando pelo fuso horario, caso voce esteja usando um servidor externo

SELECT year('1993-09-09'); -- puxa apenas o ano 

SELECT month('1993-09-09'); -- puxa apenas o mes 

SELECT MONTHNAME('1993-09-09'); -- puxa o mes com o nome do mes

SELECT WEEK('1993-09-09'); -- puxa a semana

SELECT weekday('1993-09-09'); -- puxa o numero da semana 

SELECT weekofyear('1993-09-09'); -- ele puxa a semana do ano em que eu estou

SELECT DAY('2023-05-08'); -- puxa o numero da data

SELECT DAYNAME('2023-09-09'); -- puxa o dia e o seu nome

SELECT TIMEDIFF('12:00:00', '10:30:00'); -- o TIMEDIFF traz a diferença entre duas horas diferentes que voce colocou

SELECT TIMEDIFF(CURTIME(),'08:14:54'); -- o CURTIME pega hora ATUAL 

SELECT DATEDIFF('2001:11:02', '2023:01:01'); -- DATEDIFF calcula a diferença de duas datas distintas (o resultado e o total de dias)

SELECT DATEDIFF('2001:11:02', CURDATE()); -- o CURDATE pega a data atuaç

SELECT DATEDIFF('2001:11:02', CURDATE())/365; -- aqui eu calculei o total de dias e dividi por 365 para dividir por anos

SELECT TIMESTAMPDIFF(YEAR, CURDATE(), '1993-09-09' ); -- TIMESTAMPDIFF (sendo q é obrigatório três funções dentro do parenteses) vai calcular a diferença de duas datas diferentes 

SELECT TIMESTAMPDIFF(YEAR, '1995-02-27', '2023-05-08' ); -- no caso do TIMESTAMPDIFF voce tem q colocar a data antiga depois

SELECT TIMESTAMPDIFF(WEEK, '1995-02-27', '2023-05-08' ); -- agora ele puxou a diferenças de semanas entre as datas

SELECT TIMESTAMPDIFF(HOUR, '1995-02-27', '2023-05-08' ); -- agora puxou em horas

SELECT DATE_FORMAT('1993-09-10', '%D/%M/%Y'); -- O DATE_FORMAT serve pra formatar como a data e mostrada, D = dia M = mes Y = ano. se colocar o 'd' ou 'm' ou 'y' em minusculo mostra com menos informações

SELECT current_user(); -- serve pra puxar o usuario 

SELECT TIME_TO_SEC('01:00:00');

SELECT SEC_TO_TIME(3600);

SELECT length('luciano'); #conta o tanto de dados

SELECT TRIM('       LUCIANO     '); #tira os espaços

select length(trim('         luciano      ')); #esta contando os daods apenas das letras 

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE VIEW vw_ponto_eletronico AS  -- o VIEW  e o negocio de automatização. E tbm salva o select, para facilitar 
SELECT 
     f.id as id_funcionario,
	 f.nome as funcionario, 
     h.horario
FROM tb_funcionario AS f
INNER JOIN tb_horario AS h
ON f.id = h.id_funcionario ; 

select * from vw_ponto_eletronico;




SELECT nome, dt_nascimento, TIMESTAMPDIFF(YEAR, dt_nascimento, curdate() ) idade 
 FROM tb_artista
WHERE dt_nascimento <> 0000-00-00; -- aqui eu puxei as idade dos artistas







-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



USE db_discoteca;
	
SELECT 
      nome,
      dt_nascimento,
      CONCAT('ola me chamo ', nome,' e nasci em  ',  -- junta os dados strings em uma frase inteira no resultado
      DATE_FORMAT(dt_nascimento,'%d/%m/%Y')) AS 'nome e nascimento'  -- O DATE_FORMAT serve pra formatar como a data e mostrada, D = dia M = mes Y = ano. se colocar o 'd' ou 'm' ou 'y' em minusculo mostra com menos informações
FROM tb_artista
WHERE dt_nascimento <> '0000-00-00'
;






-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT REPLACE('Coração', 'ç', 'c'); -- o REPLACE ira substituir na ordem ('palavra'1, 'letra a ser trocada'2, 'leta q vai substituir'3)

SELECT 'coração';

SELECT REPLACE(REPLACE('coração','ç','c'),'ã','a');


DELIMITER //

CREATE FUNCTION fn_maiuscula(texto VARCHAR  (255))
RETURNS VARCHAR (255)
DETERMINISTIC 
     BEGIN
          DECLARE resultado VARCHAR (255); 
          
          SET resultado = REPLACE(texto, 'a' , 'A' );
		  SET resultado = REPLACE(resultado, 'e' , 'E' );
		  SET resultado = REPLACE(resultado, 'i' , 'I' );
          SET resultado = REPLACE(resultado, 'o' , 'O' );
		  SET resultado = REPLACE(resultado, 'u' , 'U' );
		  

       RETURN resultado;
     
     END// 





DELIMITER ;



-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fn_maiuscula;

SELECT UPPER('luciano'); #transforma todas as istrings dentro dos parenteses em maiusculo 

SELECT LOW('MINUSCULO');#transforma todas as istrings dentro dos parenteses em minusculo 
















