var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Usuario = require('../models').Usuario;

let sessoes = [];

/* Recuperar usuário por login e senha */
router.post('/autenticar', function(req, res, next) {
	console.log('Recuperando usuário por login e senha');

	var login = req.body.email; // depois de .body, use o nome (name) do campo em seu formulário de login
	var senha = req.body.senha; // depois de .body, use o nome (name) do campo em seu formulário de login	
	
	let instrucaoSql = `select * from tbUsuario where email='${login}' and senha='${senha}'`;
	console.log(instrucaoSql);

	sequelize.query(instrucaoSql, {
		model: Usuario
	}).then(resultado => {
		console.log(`Encontrados: ${resultado.length}`);

		if (resultado.length == 1) {
			sessoes.push(resultado[0].dataValues.login);
			console.log('sessoes: ',sessoes);
			res.json(resultado[0]);
		} else if (resultado.length == 0) {
			res.status(403).send('Login e/ou senha inválido(s)');
		} else {
			res.status(403).send('Mais de um usuário com o mesmo login e senha!');
		}

	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
  	});
});

/* Cadastrar usuário */
router.post('/cadastrar', function(req, res, next) {
	console.log('Criando um usuário');
	
	Usuario.create({
		nome : req.body.nome,
		email : req.body.email,
		Tel_Residencial : req.body.Tel_Residencial,
		Celular : req.body.Celular,
		CPF : req.body.CPF,
		senha: req.body.senha,
		fkEmpresa: req.body.fkEmpresa
	}).then(resultado => {
		console.log(`Registro criado: ${resultado}`)
        res.send(resultado);
    }).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
  	});
});

// Update usuario

router.post('/alterar', function(req, res, next) {
	console.log('Recuperando usuário por login e senha');
	
	var nome = req.body.nome;
	var telefone = req.body.telefone;
	var celular = req.body.celular;
	var senha = req.body.senha
	var login = req.body.email; // depois de .body, use o nome (name) do campo em seu formulário de login
	// var senha = req.body.senha; // depois de .body, use o nome (name) do campo em seu formulário de login	
	
	let instrucaoSql = `select idUsuario from tbUsuario where email='${login}'`;
	// let instrucaoSql = `update tbUsuario set nome = '${nome}' where idUsuario = 7`;
	console.log(instrucaoSql);

	sequelize.query(instrucaoSql, {
		model: Usuario
	}).then(resultado => {
		console.log(`Encontrados: ${resultado[0].dataValues.idUsuario}`);

		if (resultado.length == 1) {
			// sessoes.push(resultado[0].dataValues.login);
			console.log('ID: ',resultado[0].dataValues.idUsuario);
			let id = resultado[0].dataValues.idUsuario;
			if (nome != "") {
				let update = `update tbUsuario set nome = '${nome}' where idUsuario = ${id}`;
				sequelize.query(update)
			}
			if (telefone != "") {
				let update = `update tbUsuario set Tel_Residencial = '${telefone}' where idUsuario = ${id}`;
				sequelize.query(update)
			}
			if (celular != "") {
				let update = `update tbUsuario set Celular = '${celular}' where idUsuario = ${id}`;
				sequelize.query(update)
			}
			if (senha != "") {
				let update = `update tbUsuario set senha = '${senha}' where idUsuario = ${id}`;
				sequelize.query(update)
			}
			res.send("Informações alteradas com sucesso");
			
		} else if (resultado.length == 0) {
			res.status(403).send('Email não encontrado');
		} else {
			res.status(403).send('Mais de um usuário com o mesmo login e senha!');
		}

	}).catch(erro => {
		console.error(erro);
		res.status(500).send("Insira o seu email cadastrado");
  	});
});


/* Verificação de usuário */
router.get('/sessao/:login', function(req, res, next) {
	let login = req.params.email;
	console.log(`Verificando se o usuário ${login} tem sessão`);
	
	let tem_sessao = false;
	for (let u=0; u<sessoes.length; u++) {
		if (sessoes[u] == login) {
			tem_sessao = true;
			break;
		}
	}

	if (tem_sessao) {
		let mensagem = `Usuário ${login} possui sessão ativa!`;
		console.log(mensagem);
		res.send(mensagem);
	} else {
		res.sendStatus(403);
	}
	
});


/* Logoff de usuário */
router.get('/sair/:login', function(req, res, next) {
	let login = req.params.email;
	console.log(`Finalizando a sessão do usuário ${login}`);
	let nova_sessoes = []
	for (let u=0; u<sessoes.length; u++) {
		if (sessoes[u] != login) {
			nova_sessoes.push(sessoes[u]);
		}
	}
	sessoes = nova_sessoes;
	res.send(`Sessão do usuário ${login} finalizada com sucesso!`);
});


/* Recuperar todos os usuários */
router.get('/', function(req, res, next) {
	console.log('Recuperando todos os usuários');
	Usuario.findAndCountAll().then(resultado => {
		console.log(`${resultado.count} registros`);

		res.json(resultado.rows);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
  	});
});

module.exports = router;
