CREATE DATABASE Faculdade;

USE Faculdade;

CREATE TABLE Aluno(RA INT IDENTITY, 
                    Nome_Completo VARCHAR(50) NOT NULL,
                    Endereco_Cidade VARCHAR(50) NOT NULL,
                    Endereco_Estado VARCHAR(50) NOT NULL,
                    Endereco_Logradouro VARCHAR(50) NOT NULL,
                    Endereco_Numero VARCHAR(50) NOT NULL,
                    Endereco_Bairro VARCHAR(50) NOT NULL,
                    Telefone VARCHAR(15) NOT NULL,
                    Email VARCHAR(50) NOT NULL,
                    Nascimento DATE NOT NULL,
                    CONSTRAINT pk_aluno PRIMARY KEY (RA));

INSERT INTO Aluno 
VALUES ('Matheus Lavorenti Miranda','Araraquara', 'SP', 'Rua Alexandrina Vieira Monteiro', 518, 'Jardim Eliana', '(016)98204-3329', 'matheus.miiranda@hotmail.com', '2001-01-30');

INSERT INTO Aluno 
VALUES ('Vinicius Vieira','Araraquara', 'SP', 'Rua da Alegria', 212, 'Yolanda', '(016)99242-3212', 'vinicius.vieira@gmail.com', '1990-02-12');

INSERT INTO Aluno 
VALUES ('Pedro Soares','Araraquara', 'SP', 'Rua Italia', 434, 'Parque SP', '(016)92342-1112', 'pedro.soares@gmail.com', '1990-05-15');

INSERT INTO Aluno 
VALUES ('Andre de Souza','Araraquara', 'SP', 'Avenida Portugal', 663, 'Carmo', '(016)92112-2522', 'andre.souza@outlook.com', '2002-12-25');

INSERT INTO Aluno 
VALUES ('Gabriel Gonçalves','Araraquara', 'SP', 'Avenida Brasil', 1009, 'Centro', '(016)98243-3268', 'gabriel.goncalves@bol.com.br', '2001-07-21');

CREATE TABLE Disciplina(Codigo VARCHAR(6),
                        Nome VARCHAR(30),
                        Carga_Horaria DECIMAL(2,1),
                        Semestre INT,
                        CONSTRAINT pk_disciplina PRIMARY KEY (Codigo));

INSERT INTO Disciplina
VALUES ('FMTS1', 'Fundamentos de Matemática', 66.7, 1);

INSERT INTO Disciplina
VALUES ('HTCS1', 'História da Ciência e da Tecnologia', 33.3, 1);

INSERT INTO Disciplina
VALUES ('IACS1', 'Introdução à Computação', 33.3, 1);

INSERT INTO Disciplina
VALUES ('LITS1', 'Leitura, Interpretação e Produção de Textos', 33.3, 1);

INSERT INTO Disciplina
VALUES ('LPES1', 'Linguagem de Programação Estruturada', 66.7, 1);

INSERT INTO Disciplina
VALUES ('LOGS1', 'Lógica de Programação', 100.0, 1);



CREATE TABLE Status_Aprovacao(Codigo INT IDENTITY, Nome VARCHAR(30),
                            CONSTRAINT pk_aprovacao PRIMARY KEY (Codigo));
INSERT INTO Status_Aprovacao VALUES ('APROVADO');
INSERT INTO Status_Aprovacao VALUES ('REPROVADO POR NOTA');
INSERT INTO Status_Aprovacao VALUES ('REPROVADO POR FREQUENCIA');
INSERT INTO Status_Aprovacao VALUES ('CURSANDO');



CREATE TABLE Matricula(Disciplina VARCHAR(6) NOT NULL, 
                        Aluno INT NOT NULL,
                        Nota_1 DECIMAL(10, 2),
                        Nota_2 DECIMAL(10, 2),
                        Nota_Media DECIMAL(10, 2),
                        Nota_Sub DECIMAL(10,2),
                        Status_Aprovacao INT NOT NULL, 
                        Frequencia DECIMAL(5, 2) NOT NULL,
                        Data_Inicio DATE NOT NULL,
                        Data_Previsao_Fim DATE NOT NULL,
                        Semestre_Atual INT NOT NULL,
                        CONSTRAINT fk_matricula_disciplina FOREIGN KEY (Disciplina) REFERENCES Disciplina(Codigo),
                        CONSTRAINT fk_matricula_aluno FOREIGN KEY (Aluno) REFERENCES Aluno(RA),
                        CONSTRAINT fk_matricula_aprovacao FOREIGN KEY (Status_Aprovacao) REFERENCES Status_Aprovacao(Codigo),
                        CONSTRAINT pk_matricula PRIMARY KEY (Aluno, Disciplina));


INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('FMTS1', 1, 4, 66.7, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('HTCS1', 1, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('IACS1', 1, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LITS1', 1, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LOGS1', 1, 4, 100.0, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LPES1', 1, 4, 66.7, '2022-02-22', '2022-07-22', 1);

INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('FMTS1', 2, 4, 66.7, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('HTCS1', 2, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('IACS1', 2, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LITS1', 2, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LOGS1', 2, 4, 100.0, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LPES1', 2, 4, 66.7, '2022-02-22', '2022-07-22', 1);

INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('FMTS1', 3, 4, 66.7, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('HTCS1', 3, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('IACS1', 3, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LITS1', 3, 4, 33.3, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LOGS1', 3, 4, 100.0, '2022-02-22', '2022-07-22', 1);
INSERT INTO Matricula (Disciplina, Aluno, Status_Aprovacao, Frequencia, Data_Inicio, Data_Previsao_Fim, Semestre_Atual)
VALUES ('LPES1', 3, 4, 66.7, '2022-02-22', '2022-07-22', 1);

-- ------------------------------------TESTE REPROVADO POR FALTA------------------------------------------
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 1, @Nota = 1, @Valor_Nota = 6, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 1, @Nota = 1, @Valor_Nota = 5, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 1, @Nota = 1, @Valor_Nota = 6, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 1, @Nota = 1, @Valor_Nota = 5, @Frequencia = 29.3; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 1, @Nota = 1, @Valor_Nota = 8, @Frequencia = 24.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 1, @Nota = 1, @Valor_Nota = 8, @Frequencia = 54.7; --6
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 1, @Nota = 2, @Valor_Nota = 6, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 1, @Nota = 2, @Valor_Nota = 7, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 1, @Nota = 2, @Valor_Nota = 6, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 1, @Nota = 2, @Valor_Nota = 7, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 1, @Nota = 2, @Valor_Nota = 4, @Frequencia = 25.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 1, @Nota = 2, @Valor_Nota = 3, @Frequencia = 54.7; --6
-- ------------------------------------TESTE REPROVADO POR NOTA-------------------------------------------
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 2, @Nota = 1, @Valor_Nota = 6, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 2, @Nota = 1, @Valor_Nota = 5, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 2, @Nota = 1, @Valor_Nota = 6, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 2, @Nota = 1, @Valor_Nota = 5, @Frequencia = 29.3; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 2, @Nota = 1, @Valor_Nota = 8, @Frequencia = 25.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 2, @Nota = 1, @Valor_Nota = 8, @Frequencia = 54.7; --6
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 2, @Nota = 2, @Valor_Nota = 6, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 2, @Nota = 2, @Valor_Nota = 7, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 2, @Nota = 2, @Valor_Nota = 6, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 2, @Nota = 2, @Valor_Nota = 5, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 2, @Nota = 2, @Valor_Nota = 4, @Frequencia = 25.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 2, @Nota = 2, @Valor_Nota = 3, @Frequencia = 54.7; --6
-- --------------------------------TESTE APROVADO----------------------------------------------------------
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 33.3; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 29.3; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 100.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 3, @Nota = 1, @Valor_Nota = 10, @Frequencia = 54.7; --6
EXEC AtualizaNota @Disciplina = 'FMTS1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 66.7; --6
EXEC AtualizaNota @Disciplina = 'HTCS1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'IACS1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LITS1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 29.9; --3
EXEC AtualizaNota @Disciplina = 'LOGS1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 100.0; --100
EXEC AtualizaNota @Disciplina = 'LPES1', @Aluno = 3, @Nota = 2, @Valor_Nota = 10, @Frequencia = 54.7; --6


-- SELECIONA Dados do Aluno em Disciplina e Ano especifico
EXEC Consulta_MatriculasDisciplinaAno @Disciplina = 'HTCS1', @Ano = 2022;

-- SELECIONA Notas, Faltas, Sit Final de Aluno em ano especifico 
EXEC BoletimAlunoAno @Aluno = 1, @Ano = 2022;

-- SELECIONA Alunos reprovados por Nota no Ano especifico
EXEC AlunosReprovadosPorMateriaNoAno @Ano = 2022;

-- SELECIONA IDADE DE TODOS OS ALUNOS INSCRITOS NO CURSO
SELECT Nome_Completo, DATEDIFF(YY, Nascimento, GETDATE()) AS [Idade]
FROM Aluno;
