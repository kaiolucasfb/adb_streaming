INSERT INTO tb_usuario
(id, nome, dt_nascimento, email, senha, nickname)
VALUES

(1, 'igor', '2001-12-13', 'igormanga@gmail.com', 'a123a', 'trevoso'),
(2, 'samuel', '2001-05-13', 'samuelmanga@gmail.com', 'b123b', 'luvevoso'),
(3, 'david', '2000-02-13', 'davidmanga@gmail.com', 'c123c', 'solvoso'),
(4, 'gabi', '2011-02-13', 'gabimanga@gmail.com', 'd123d', 'escuvoso'),
(5, 'giovanna', '2003-07-13', 'giovannamanga@gmail.com', 'a23213a', 'nevoso');


INSERT INTO tb_classe
(id, nome, descricao)
VALUES

(1, 'barbaro', 'tem os poderes do passado do vilao com um extra alcoolismo'),
(2, 'monge', 'tem os jutsus do harry potter para mata os inimigo');


INSERT INTO tb_personagem 
(id, nome, genero, nivel, experiencia, id_usuario, id_classe)
VALUES
(1, 'DeuBug', 'm',1,0,1,1),
(2, 'BitBug', 'f',1,0,2,2);

INSERT INTO tb_habilidade 
(id, nome, descricao)
VALUES 
(1, 'lança mortal','faz mortais, corre o risco de quebra o pescoço e perder a vida'),
(2, 'escudo supremo', ' O poder do escudo impenetravel, apenas o lança mortal é capaz de quebraço'),
(3, 'recupera vida','traz a vida um personagem, mas para funcionar dez vilões precisam ser mortos');

INSERT INTO tb_classe_habilidade
(id_classe, id_habilidade)
VALUES 
(1,1),
(1,2),
(2,3);


USE db_rpg;



