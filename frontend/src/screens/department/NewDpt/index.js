import React from 'react'

import './styles.css'

export default function NewDpt() {

    return (
        <div className="department-container">
            <h1>Cadastrar Novo Departamento</h1>

            <form>
                <input placeholder="Nome do Departamento" />
                <button type="submit">Salvar</button>
            </form>
        </div>
    )
}