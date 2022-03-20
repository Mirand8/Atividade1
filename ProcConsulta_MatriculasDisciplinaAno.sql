-- shows alunos, notas, faltas e situacao_aprov from matricula where @ano e @disciplina 

CREATE OR ALTER PROC Consulta_MatriculasDisciplinaAno @Disciplina VARCHAR(6), @Ano VARCHAR(4)
AS 

    SELECT Disciplina, a.Nome_Completo, Nota_1, Nota_2, Nota_Media, Nota_Sub, Frequencia, sa.Nome AS [Status], YEAR(Data_Inicio) AS [Ano]
    FROM dbo.Matricula m
        INNER JOIN dbo.Aluno a ON a.RA = m.Aluno
        JOIN dbo.Status_Aprovacao sa ON sa.Codigo = m.Status_Aprovacao
        WHERE Disciplina = @Disciplina AND YEAR(Data_Inicio) = @Ano;

GO