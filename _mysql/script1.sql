select * from tb_Departamento;
select * from tb_curso;	
select * from tb_turma;				
select * from tb_aluno;
select * from tb_disciplina;
select * from tb_endereco_aluno;
select * from tb_tipo_logradouro;

select dis.codDisciplina, dis.nomeDisciplina, dis.cargaHoraria, dep.nomeDepartamento from tb_disciplina  dis inner join tb_departamento dep
on dis.codDepartamento = dep.codDepartamento
order by dis.nomeDisciplina;

select alu.RA_Aluno, alu.nomeAluno, alu.sobrenomeAluno, alu.sexo,
curso.nomeCurso, tur.turno from tb_aluno alu inner join tb_curso curso
on alu.codCurso = curso.codCurso
inner join tb_turma tur
on alu.codTurma = tur.codTurma;

create view vw_cadastro_aluno as
select alu.RA_Aluno, alu.cpf, alu.nomeAluno, alu.sobrenomeAluno, alu.sexo, alu.nomeMae, alu.nomePai, 
logr.tipoLogradouro, ende.nomeRua, ende.numCasa, ende.complemento 
from tb_aluno alu inner join tb_endereco_aluno ende
on alu.endereco = ende.codEndereco
inner join tb_tipo_logradouro logr
on ende.codtipoLogradouro = logr.codLogradouro;

select * from vw_cadastro_aluno;