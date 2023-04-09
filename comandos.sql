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

