const express = require('express')

const DepartmentController = require('./controllers/DepartmentController')
const DisciplineController = require('./controllers/DisciplineController')
const StudentController = require('./controllers/StudentController')
const routes = express.Router()


// ROTAS PARA ACESSO À TABELA DE ALUNOS E SEUS DADOS
routes.get('/studentspd', StudentController.list)

// ROTAS PARA ACESSO À TABELA DE DISCIPLINAS
routes.get('/disciplinesbasic', DisciplineController.list)

// ROTAS PARA ACESSO À TABELA DE DEPARTAMENTOS
routes.get('/depts', DepartmentController.list)
routes.post('/depts', DepartmentController.create)


module.exports = routes