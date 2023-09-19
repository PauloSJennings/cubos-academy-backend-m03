CREATE TABLE usuarios (
	id serial,
  	nome text not null,
  	idade smallint,
  	email varchar(50),
  	senha varchar(8) not null
);


INSERT INTO usuarios (nome, idade, email, senha)
VALUES 
('Camden H. Bartlett', 15, 'turpis.vitae.purus@risusDuisa.ca', 'p3P96F3Q'),
('Raja W. Coffey', 30, 'raja.feugiat@nonummy.com', 's5F51T7L'),
('Elton D. Olsen', 29, 'auctor@duiFuscediam.edu', 'k5X25B0R'),
('Shelley E. Frederick', 20, 'raja.feugiat@nonummy.com', 'u2D18F6E');


UPDATE usuarios
SET nome = 'Raja W. Coffey Thomas'
WHERE id = 3;


DELETE FROM usuarios WHERE id = 5;


alter table usuarios add constraint email_unique_usuarios unique(email);


INSERT INTO usuarios (nome, idade, email, senha)
VALUES 
('Jermaine G. Sellers', 16, 'ligula.Nullam@tortordictum.co.uk', 'o2P56U9U'),
('James D. Kennedy', 23, 'amet@Nulladignissim.com', 'q6B78V3V'),
('Amelia S. Harris', 29, 'nec.metus.facilisis@vitaealiquet.edu', 'l4S64Y3A'),
('Joel M. Hartman', 18, 'montes.nascetur@odiotristique.co.uk', 'c4Q27D7O'),
('Elmo K. Greer', 18, 'risus.Duis@eget.ca', 'e3P92I7R');


alter table usuarios add column situacao boolean default true;


UPDATE usuarios
SET situacao = false
WHERE email = 'montes.nascetur@odiotristique.co.uk';


UPDATE usuarios
SET senha = 'k9P31H1O'
WHERE email = 'risus.Duis@eget.ca';


alter table usuarios drop column idade, add column data_nascimento date;


UPDATE usuarios
SET data_nascimento = '1991-09-29'
WHERE email = 'auctor@duiFuscediam.edu';

UPDATE usuarios
SET data_nascimento = '1988-11-02'
WHERE email = 'nec.metus.facilisis@vitaealiquet.edu';

DELETE FROM usuarios WHERE data_nascimento IS NULL;


alter table usuarios alter column data_nascimento set not null;


INSERT INTO usuarios (nome, data_nascimento, email, senha)
VALUES
('Tate I. Dean', '1989-05-01', 'Nunc@etmagnis.edu', 'd3V25D6Y'),
('Arsenio K. Harmon', '1985-10-23', 'adipiscing.elit@turpis.com', 'm3T58S0C');
