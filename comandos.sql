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
drop table curso;
CREATE TABLE curso (
    id INTEGER primary key,
    nome VARCHAR(255) not null 
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');


select * from curso;


drop table aluno;

create table aluno (
    id serial primary key,
    nome varchar(255) not null
);

insert into aluno (nome) values ('Diogo');
insert into aluno (nome) values ('Vinicius');

select * from aluno;

create table aluno_curso(
	aluno_id integer,
	curso_id integer,
	primary key(aluno_id, curso_id),
	
	foreign key (aluno_id)
	references aluno (id),
	
	foreign key (curso_id)
	references curso (id)	
);

insert into aluno_curso(aluno_id, curso_id) values(1,1);
insert into aluno_curso(aluno_id, curso_id) values(2,1);
insert into aluno_curso(aluno_id, curso_id) values(3,1);

select * from aluno_curso;

drop table aluno_curso;

select * from aluno;
select * from curso;

select aluno.nome as aluno_nome, curso.nome as curso from aluno 
	join aluno_curso on aluno_curso.aluno_id = aluno.id
	join curso on curso.id = aluno_curso.curso_id;
	
insert into aluno_curso (aluno_id, curso_id) values (2,2);


insert into aluno (nome) values('Nico');

insert into curso (id, nome) values (3,'CSS');

select aluno.nome as aluno_nome, curso.nome as curso from aluno 
	left join aluno_curso on aluno_curso.aluno_id = aluno.id
	left join curso on curso.id = aluno_curso.curso_id;

select aluno.nome as aluno_nome, curso.nome as curso from aluno 
	right join aluno_curso on aluno_curso.aluno_id = aluno.id
	right join curso on curso.id = aluno_curso.curso_id;


select aluno.nome as aluno_nome, curso.nome as curso from aluno 
	full join aluno_curso on aluno_curso.aluno_id = aluno.id
	full join curso on curso.id = aluno_curso.curso_id;

select aluno.nome as aluno_nome, curso.nome as curso from aluno 
	cross join curso;

insert into aluno (nome) values('João');

-- aula 5

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

DELETE FROM alunos WHERE id =1;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
	 ON DELETE CASCADE,
	
	FOREIGN KEY (curso_id)
   REFERENCES curso (id)
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,3);


SELECT * FROM aluno_curso;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

DELETE FROM aluno WHERE id =1;

SELECT * FROM aluno;

UPDATE aluno
	SET id = 10
	WHERE id = 2
	
SELECT * FROM aluno;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

UPDATE aluno
	SET id = 20
	WHERE id = 4;
	
DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
	 ON DELETE CASCADE
	 ON UPDATE CASCADE,
	
	FOREIGN KEY (curso_id)
   REFERENCES curso (id)
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
 SELECT
 	   aluno.id   AS aluno_id,
	   aluno.nome as "Nome do aluno",
	   curso.id   AS curso_id,
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

UPDATE aluno
	SET id = 10
	WHERE id = 2;
	
SELECT * FROM aluno_curso;

-- aula 6

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Alberto', 'Oliveira');

SELECT * 
    FROM funcionarios
    ORDER BY nome, matricula desc;
	
SELECT * 
    FROM funcionarios
    ORDER BY 3,4,2;
	
SELECT * 
    FROM funcionarios
    ORDER BY 4 desc, funcionarios.nome desc, 2 asc;
	
	
SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome
	

SELECT *
  FROM funcionarios
  ORDER BY nome
LIMIT 5;
	
SELECT *
  FROM funcionarios
  ORDER BY id
 LIMIT 5
OFFSET 1;	
	
-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros	
	
SELECT COUNT (id)
  FROM funcionarios;	
	
	
SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM funcionarios;	
	
SELECT DISTINCT
        nome
  FROM funcionarios
  ORDER BY nome;
	
SELECT DISTINCT
        nome,
        sobrenome
  FROM funcionarios
  ORDER BY nome;	
	
SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;

SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT curso.nome
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1;
	
SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id;	
    WHERE COUNT(aluno.id) = 0
GROUP BY 1

SELECT nome,
       COUNT(id)
    FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1;