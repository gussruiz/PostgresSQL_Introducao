-- aula 1

CREATE TABLE aluno
(
    id SERIAL,
    nome_aluno VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

ALTER TABLE aluno RENAME COLUMN obeservacao TO observacao;

SELECT * FROM aluno;

-- aula 2


insert into aluno (
	nome_aluno,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
)
values (
	'Gustavo',
	'12345678901',
	'Fusce ac mauris non orci vestibulum sodales. Integer metus augue, tempor non nunc dictum, volutpat vehicula libero. Sed commodo imperdiet nisi, vitae luctus nisi vehicula eu. Quisque nec ante lectus. Aliquam rhoncus consequat ex et pharetra. Donec volutpat metus vitae sapien dictum, at commodo ipsum auctor. Donec blandit, nulla ut dictum rutrum, nulla nulla posuere lorem, consectetur consectetur urna lorem eget nunc. Sed dapibus ex quis nulla imperdiet malesuada. Integer et cursus ante, quis tincidunt justo.',
	21,
	1527.45,
	1.84,
	true,
	'2002-02-18',
	'18:40:00',
	'2023-04-09 15:47:31'
)

select * from aluno;


select * 
	from aluno
	where id = 2
;

update aluno
	set nome_aluno = 'Lucas Brito',
		cpf = '21436587091',
		observacao = 'teste update',
		idade = '21',
		dinheiro = 12.23,
		altura = 1.73,
		ativo = false,
		data_nascimento = '2000-06-30',
		hora_aula = '17:30:00',
		matriculado_em = '2021-02-011 16:00:01'
	where id = 2;

select * from aluno;
-- fazer um filtro antes para filtrar o delete
select * from aluno where nome_aluno = 'Lucas Brito';

delete from aluno where nome_aluno = 'Lucas Brito';

select * from aluno;

-- aula 3

select nome_aluno as "Nome do aluno", idade, matriculado_em as "Quanod se Matriculou" from aluno where id = 1;

INSERT INTO aluno (nome_aluno) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome_aluno) VALUES ('Nico Steppat');
INSERT INTO aluno (nome_aluno) VALUES ('João Roberto');
INSERT INTO aluno (nome_aluno) VALUES ('Diego');

select * from aluno where nome_aluno = 'Gustavo';

select * from aluno where nome_aluno <> 'Gustavo'; --diferente 

select * from aluno where nome_aluno != 'Gustavo';

select * from aluno where nome_aluno like 'Gus_avo'; -- torna o caracter um coringa, pode ser qualuqer um mas que tenha o resto como igual

select * from aluno where nome_aluno not like 'Gus_avo'; -- mesma coisa porem com inversão

select * from aluno where nome_aluno like 'G%'; -- semelhante ao anterior mas ao inves de um grupo de letras ser definido aqui apenas uma letra

select * from aluno where nome_aluno like '%i%a%'; -- pode ser agrupado também 



select * from aluno where cpf is null;

select * from aluno where cpf is not null;

select * from aluno where idade = 21;

select * from aluno where idade <> 21; -- <> mesma coisa que !=

select * from aluno where idade >= 21;

select * from aluno where idade <= 21;

select * from aluno where idade between 15 and 25;


select * from aluno where nome_aluno like 'G%' and cpf is not null;

select * from aluno where nome_aluno like 'Gustavo' or nome_aluno like 'Rodrigo' or nome_aluno like 'Nico%'; 

-- aula 4








