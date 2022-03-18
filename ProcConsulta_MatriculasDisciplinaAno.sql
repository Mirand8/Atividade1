CREATE PROC Consulta_MatriculasDisciplinaAno @Disciplina VARCHAR(6), @Ano VARCHAR(4)
AS 

SELECT Disciplina, Aluno, Nota_1, Nota_2, Nota_Media, Nota_Sub, Frequencia, Status_Aprovacao, YEAR(Data_Inicio) AS [Ano]
FROM Matricula
WHERE Disciplina = @Disciplina AND YEAR(Data_Inicio) = @Ano;

GO