const express = require('express')
const connection = require('./database/connection')

const routes = express.Router()


routes.get('/studentspd', async (req,res) => {

    const studentpd = await connection('vw_listSudentsPD').select('*')

    return res.json(studentpd)
})

routes.get('/disciplinesbasic', async (req,res) => {

    const disciplinesbasic = await connection('vw_disciplinesBasic')
    .select('*')

    return res.json(disciplinesbasic)
})

module.exports = routes