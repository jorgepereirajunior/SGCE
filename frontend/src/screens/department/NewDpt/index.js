import React, { useState } from 'react'

import './styles.css'

import api from '../../../services/api'

export default function NewDpt() {
    const [nomeDepartamento, setNome] = useState('')
    
    async function effectNewDpt(e) {
        e.preventDefault()

        const data = {
            nomeDepartamento
        }

        try {
           const response = await api.post('depts', data)

            alert(`Código do departamento: ${response.data.codDepartamento}`)
        } catch (error) {
            alert('Não foi possível cadastrar!!')
        }
    }

    return (
        <div className="department-container">
            <h1>Cadastrar Novo Departamento</h1>

            <form onSubmit={effectNewDpt}>
                <input 
                    placeholder="Nome do Departamento" 
                    value={nomeDepartamento}
                    onChange={e => setNome(e.target.value)}
                />
                <button type="submit">Salvar</button>
            </form>
        </div>
    )
}