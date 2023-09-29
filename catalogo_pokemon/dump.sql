CREATE TABLE usuarios (
	id serial primary key,
  nome text not null,
  email text unique not null,
  senha text not null
);

CREATE TABLE pokemons (
	id serial primary key,
  usuario_id integer not null references usuarios(id),
  nome text not null,
  habilidades text not null,
  imagem text,
  apelido text
);