SELECT * FROM tb_genero;

INSERT INTO tb_gravadora
    (id_gravadora,nome)
    
VALUES
('0','mk music'),
('0','music brokers '),
('0','som livre'),
('0','sony music'),
('0','warner music brasil'),
('0','asylum records'),
('0','polyphon'),
('0','gold typhoon'),
('0','favored nations'),
('0','brain records');


SELECT * FROM tb_artista;

INSERT INTO tb_tipo_artista
         (nome)
VALUES	


('concerto'),
('dupla'),
('artista solo');


INSERT INTO tb_genero
   (id_genero, nome)

VALUES
         (0,'nacional'),
         (0,'lo fi'),
         (0,'reggae'),
         (0,'eletronica'),
         (0,'funk'),
         (0,'rock metal'),
         (0,'rock');
		
         












INSERT INTO tb_artista
         (nome, dt_nascimento, id_tipo_artista)
VALUES	
	     ('LU','1962-08-06',4),
         ('calcinha preta', null,1),
         ('Paul Gauguin', '1848-05-02',4),
         ('rolling stones', null,1),
         ('the doors', null,1),
         ('cream', null,1),
         ('led zeppelin', null,1),
         ('black sabbath',null,1),
         ('sex pistols',null,1),
         ('montley crue',null,1),
         ('nirvana',null,1),
         ('edson gomes','1955-07-03',4),
         ('ventania','1962-01-21',4),
         ('capital inicial',null,1),
         ('skank', '1991-05-04', 4),
         ('chorão', '1970-03-09', 4),
         ('slipknot', null, 1),
         ('sabotage','1973-03-03', 4),
         ('cleitinho rasta','1980-03-04', 4);
         
         INSERT INTO tb_disco 
         ( titulo, duracao, ano_lancamento, id_artista, id_gravadora, id_genero)
         
         VALUES
         ('Acid tears','00:10:00','1993',96,'6','7'),
         ('Arch Enemy','00:45:00',1997,'97','6',3 ),
         ('The Spaghetti Incident?','00:25:00','1993',98,'8','7'),
         ('Metal Jukebox','00:50:00','1999',99,'9','6'),
         ('garage inc','00:35:00','1998',100,'10','7'),
         ('Under Cöver ','01:00:00','2017',101,'5','3'),
         ('raimundos','01:30:00','2005',102,'4','2'),
         ('Renegades','01:45:04','2000',103,'3','1'),
         ('Covered in Blood' ,'01:30:34' ,'2019',104,'2','4'),         
         ('eMotive','3:00:00','2004',105,'1', 5 );
         SELECT * FROM tb_disco;
         
         
         
          INSERT INTO tb_musica
         ( nome, duracao, id_disco)
         
         VALUES
		('smooth criminal','00:03:00',21),
        ('Smells Like Teen Spirit','00:05:01',21),
        ('Vogue','00:05:16',21),
        ('I Want it That Way','00:03:33',21),
        ('Wonderwall','00:01:01',21),
        ('Black or White','00:02:03',21),
        ('Livin on a Prayer','00:04:05',21),
        ('No Scrubs','00:04:6',21),
        ('Gangstas Paradise','00:10:01',21),
        ('Nothing Compares 2 U','00:09:09',21),
        ('Baby One More Time','00:07:21',21);
        
        
         INSERT INTO tb_musica
         ( nome, duracao, id_disco)
         
         VALUES
         ('Losing My Religion','00:01:93','22'),
         ('I Will Always Love You','00:01:93','22'),
         ('jeremy','00:01:93','22'),
         ('torn','00:01:93','22'),
		 ('waterfalls','00:01:40','22'),
         ('wannabe','00:01:03','22'),
         ('don t speak','00;01:30','22'),
         ('alll i wanna do','00:01:20','22'),
         ('one','00:01:10','22');
         
          INSERT INTO tb_musica
         ( nome, duracao, id_disco)
         
         VALUES
         ('Zombie','00;01:30','23'),
         ('Believe','00;01:30','23'),
         ('Creep','00;01:30','23'),
         ('ICE ICE BABY','00;01:30','23'),
         ('livin la vida loca','00;01:30','23'),
         ('the way you make me fell','00;01:30','23'),
         ('genie in a bottle','00;01:30','23'),
         ('fly away','00;01:30','23'),
         ('no diggity','00;01:30','23'),
         ('enter sandman','00;01:30','23');
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
