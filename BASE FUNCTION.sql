USE db_discoteca2;


CREATE FUNCTION fn_soma (numero1 INT, numero2 INT)  -- toda função tem que ter um return(s) 
RETURNS INT -- returns serve pra mostra um tipo de saida para o dado 
READS SQL DATA 
    RETURN numero1 + numero2; -- return sem S serve pra mostra o resultado 
  
  
  
  -- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  CREATE FUNCTION fn_mutiplicacao (numero1 INT, numero2 INT)
  RETURNS INT
  READS SQL DATA
      RETURN numero1 * numero2;
      
      

      -- PROFESSOR
      
      CREATE FUNCTION  fn_multiplica(n1 INT, n2 INT) 
      RETURNS INT
      READS SQL DATA 
          RETURN n1 * n2;
      -- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

      
      
      CREATE FUNCTION fn_divisao (numero1 FLOAT, numero2 FLOAT)
      returns FLOAT 
      READS SQL DATA
        RETURN numero1/numero2;

-- PROFESSOR


  CREATE FUNCTION  fn_divisao2(n1 INT, n2 INT) 
      RETURNS FLOAT
      DETERMINISTIC -- DETERMENISTIC o resultados n muda de acordo com os parametros 
          RETURN n1 / n2;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 DELIMITER // -- serve pra colocar um delimitador q substitui p ; pode ser usado normalmente 


-- EXEMPLO DE UMA FUNÇÃO DE SOMA COM A MUDANÇA DO DELIMITER
DELIMITER $$ 


CREATE FUNCTION fn_soma2 (numero1 INT, numero2 INT)
RETURNS INT 
DETERMINISTIC
    BEGIN
        DECLARE soma INT; -- DECLARE significa uma variavel 
        SET soma = numero1 + numero2; 
    RETURN soma;
    END $$


DELIMITER ;


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
