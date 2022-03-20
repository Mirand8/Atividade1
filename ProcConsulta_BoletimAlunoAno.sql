-- shows notas, faltas, sit_aprov from matricula where @aluno, @disci
CREATE OR ALTER PROC BoletimAlunoAno @Aluno INT, @Ano INT
AS

    SELECT Disciplina, a.Nome_Completo, Nota_1, Nota_2, Nota_Media, Nota_Sub, Frequencia, sa.Nome AS [Status]
    FROM dbo.Matricula m
        JOIN  dbo.Aluno a ON a.RA = m.Aluno
        JOIN dbo.Status_Aprovacao sa ON sa.Codigo = m.Status_Aprovacao
    WHERE YEAR(Data_Inicio) = @Ano AND Aluno = @Aluno

GO