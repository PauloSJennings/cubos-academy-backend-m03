CREATE TABLE autores (
	id serial primary key,
  nome text not null,
  idade integer
);

CREATE TABLE livros (
	id serial primary key,
  nome text not null,
  genero text,
  editora text,
  data_de_publicacao date,
  autor_id integer references autores(id)
);