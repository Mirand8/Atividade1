CREATE OR ALTER PROC AlunosReprovadosPorMateriaNoAno @Ano INT
AS

    SELECT a.Nome_Completo, Disciplina, sa.Nome AS [Status]
    FROM dbo.Matricula m
        JOIN dbo.Aluno a ON a.RA = m.Aluno
        JOIN dbo.Status_Aprovacao sa ON sa.Codigo = m.Status_Aprovacao
    WHERE YEAR(Data_Inicio) = @Ano AND Status_Aprovacao = 2;

GO