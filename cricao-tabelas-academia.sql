/* SCRIPT DE CRIAÇÃO DAS TABELAS*/



/*CRIA A TABELA DE CADASTRO DE ALUNOS*/

create table alunos ( 
	 id_aluno varchar(18) constraint pk_id_aluno primary key, 
	 matricula int,  
	 nome varchar(50) not null,
	 telefone varchar(11) not null,
	 data_nascimento date not null,
	 peso int not null,  
	 altura int not null,
	 data_avalicao_medica date not null,  
	 endereco varchar(100) not null,
	 observacoes varchar(150)
);


/*CRIA A TABELA DE CADASTRO DE INSTRUTORES*/

create table instrutores ( 
	 id_instrutor varchar(18) constraint pk_id_instrutor primary key,
	 nome varchar(50) not null, 
	 registro_profissional varchar(5) unique not null, 
	 data_nascimento date not null, 
	 CPF varchar(11) unique not null,   
	 telefone varchar(11) not null,  
	 outros_fones bool,  
	 titulacao varchar(50) not null  	 
);


/*CRIA A TABELA DE CADASTRO DE CONTATOS EXTRAS DE CADA INSTRUTOR VINCULADO A ELE POR ID*/

create table contato_instrutores (
	id_contato_instrutor varchar(18) constraint pk_id_contato_instrutor primary key,
	telefone varchar(11),
	instrutor varchar(18) not null,
	foreign key (instrutor) references instrutores(id_instrutor) on delete cascade
);


/*CRIA A TABELA DE MODALIDADES OFERECIDAS PELA ACADEMIA*/

create table modalidades(
	id_modalidade varchar(18) constraint pk_id_modalidade primary key,
	codigo int,
	nome varchar(20) not null
);


/*CRIA A TABELA DE TURMAS POR MODALIDADE*/

create table turmas (
	 id_turma varchar(18) constraint pk_id_turma primary key,  
	 horario time not null,  
	 duracao time not null, 
	 quantidade_alunos int not null,
	 data_inicio date not null,  
	 data_fim date not null,
	 modalidade varchar(18) not null,
	 instrutor varchar(18) not null,
	 foreign key (modalidade) references modalidades (id_modalidade) on delete cascade,
	 foreign key (instrutor) references instrutores (id_instrutor) on delete cascade
	); 



	/*CRIA A TABELA QUE VINCULA TURMAS/MODALIDADES AOS ALUNOS*/

create table aluno_por_turma (
	id_aluno_por_turma varchar(18) constraint pk_id_aluno_por_turma primary key,
	aluno varchar(18) not null,
	turma varchar(18) not null,
	foreign key (aluno) references alunos(id_aluno) on delete cascade,
	foreign key (turma) references turmas(id_turma) on delete cascade
);


/*CRIA A TABELA DE CADASTRO DE MONITOR POR MODALIDADE MATRICULADO*/

create table monitor (
	id_monitor varchar(18) constraint pk_id_monitor primary key,
	aluno varchar(18) not null,
	turma varchar(18) not null,
	foreign key (aluno) references alunos(id_aluno) on delete cascade,
	foreign key (turma) references turmas(id_turma) on delete cascade
);


/*CRIA TABELA DE CADASTRO DE PRESENCAS POR AULA DE ALUNOS*/

create table presenca(
	id_presenca  varchar(18)not null,
	turma varchar(18) not null,
	aluno varchar(18) not null,
	data_aula date not null,
	presenca bool, 
	foreign key (turma) references turmas(id_turma) on delete cascade,
	foreign key (aluno) references alunos(id_aluno) on delete cascade
);

