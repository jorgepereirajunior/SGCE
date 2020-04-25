--  RETURNS STUDENT PERSONAL DATA
-- ===========================================================================================================================================
create view vw_listSudentsPD as
select aluno.RA_Aluno, aluno.cpf, aluno.nomeAluno, aluno.sobrenomeAluno, aluno.sexo, aluno.nomeMae, aluno.nomePai, aluno.email, aluno.whatsapp,
logradouro.tipoLogradouro, endereco.nomeRua, endereco.numCasa, endereco.complemento, endereco.cep 

from tb_aluno aluno inner join tb_endereco_aluno endereco
on aluno.endereco = endereco.codEndereco

inner join tb_tipo_logradouro logradouro
on endereco.codtipoLogradouro = logradouro.codLogradouro ;

select * from vw_listsudentspd;
-- ===========================================================================================================================================




--  RETURNS ALL REGISTERED DISCIPLINES AND THEIR RELATIONSHIP WITH DEPARTMENT IN BASIC OPTIONS
-- ===========================================================================================================================================
create view vw_disciplinesBasic as
select disc.codDisciplina, disc.nomeDisciplina, disc.cargaHoraria,
dpt.nomeDepartamento 

from tb_disciplina disc inner join tb_departamento dpt
on disc.codDepartamento = dpt.codDepartamento;

select * from vw_disciplinesBasic
order by codDisciplina;
-- ===========================================================================================================================================

--  RETURNS ALL REGISTERED DEPARTMENTS
-- ===========================================================================================================================================


