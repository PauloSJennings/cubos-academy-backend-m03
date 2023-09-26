const { Router } = require('express');
const pool = require('./conexao');
const { getAutores, cadastraAutor, autorPorId } = require('./controladores/autores');
const { cadastraLivro, listaLivros } = require('./controladores/livros');

const rotas = Router();


rotas.get('/', getAutores);
rotas.post('/autor/cadastro', cadastraAutor);
rotas.get('/autor/:id', autorPorId);
rotas.post('/autor/:id/cadastrolivro', cadastraLivro);
rotas.get('/livros', listaLivros);


module.exports = rotas;

