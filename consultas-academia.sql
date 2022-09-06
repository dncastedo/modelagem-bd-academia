/* SCRIPT DE CONSULTAS */  

/*1. Deve ser possível consultar os dados de cada aluno matriculado na academia e as modalidades em que estão matriculados: */

/*1.1 Todos os dados referente ao cadastro do aluno:*/

select * from alunos


/*1.2 Modalidade em que cada aluno está matriculados:*/

select alunos.nome, modalidades.nome    
from aluno_por_turma
join alunos
on alunos.id_aluno = aluno_por_turma.aluno
join turmas 
on turmas.id_turma = aluno_por_turma.turma
join modalidades
on modalidades.id_modalidade = turmas.modalidade 
order by alunos.nome


/*2 Deve ser possível consultar os dados de cada instrutor da academia, e os horários de suas turmas:*/


/*2.1 Traz todos os dados de cadastro dos instrutores:*/

select * from instrutores

/*2.2 Traz todos os números de telefone cadastrados por instrutor:*/


select * from contato_instrutores


/*2.3 Traz todos horários de aulas dos instrutores:*/

select instrutores.nome, turmas.horario 
from turmas
join aluno_por_turma
on aluno_por_turma.turma = turmas.id_turma
join instrutores 
on aluno_por_turma. = instrutores.id_instrutor

/*2.4 Modalidade que cada instrutor é responsável:*/

select instrutores.nome, modalidades.nome  
from turmas
join instrutores 
on instrutores.id_instrutor = turmas.instrutor
join modalidades
on turmas.modalidade = modalidades.id_modalidade


/*2.5 Contato extra cadastrado por instrutor: */

select contato_instrutores.telefone, instrutores.nome 
from instrutores
join contato_instrutores
on contato_instrutores.instrutor  = instrutores.id_instrutor 


/* 3. Deve ser possível consultar o horário de aula de um aluno específico: */


select alunos.nome, turmas.horario 
from turmas 
join aluno_por_turma 
on aluno_por_turma.turma = turmas.id_turma 
join alunos
on alunos.id_aluno = aluno_por_turma.aluno
where nome = 'Marina Prates'


/* 4. Deve ser possível consultar as faltas de um aluno específico com base nas turmas em que está matriculado: */

select alunos.nome, presenca.data_aula, turmas.horario, modalidades.nome 
from modalidades
join turmas
on turmas.modalidade  = modalidades.id_modalidade 
join aluno_por_turma
on aluno_por_turma.turma = turmas.id_turma 
join presenca
on presenca.turma = turmas.id_turma 
join alunos
on alunos.id_aluno = presenca.aluno 
where presenca.presenca = false and alunos.nome = 'Adriana Leite'
order by alunos.nome


/* 5. Total de faltas por aluno: */
select alunos.nome, count(presenca.presenca) as total_faltas
from presenca
join alunos
on presenca.aluno = alunos.id_aluno 
where presenca.presenca = false
group by alunos.nome
order by total_faltas








 



	


