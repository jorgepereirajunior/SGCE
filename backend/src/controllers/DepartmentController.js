const connection = require('../database/connection')


module.exports = {

    async list(req, res) {

        const depts = await connection('tb_departamento').select('*')

        return res.json(depts)
    },

    async create(req, res) {

        const { nomeDepartamento } = req.body

        const codDepartamento = await connection('tb_departamento').insert({
            nomeDepartamento,
        })

        return res.send()
    }
}