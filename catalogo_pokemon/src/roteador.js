const { Router } = require('express');
const { cadastraUsuario, login } = require('./controladores/usuarios');
const { listaPokemon, cadastraPokemon, alteraApelido, pokemonPorId, deletaPokemon } = require('./controladores/pokemon');
const { autenticaUsuario } = require('./middleware/autenticacao');
const rotas = Router();

rotas.post('/cadastro/usuario', cadastraUsuario);
rotas.post('/login', login);

rotas.use(autenticaUsuario);

rotas.get('/pokemon', listaPokemon);
rotas.post('/cadastro/pokemon', cadastraPokemon);
rotas.patch('/pokemon/apelido', alteraApelido);
rotas.get('/pokemon/:id', pokemonPorId);
rotas.delete('/pokemon', deletaPokemon);


module.exports = rotas;