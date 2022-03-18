CREATE PROC AlunosReprovadosPorMateriaNoAno @Ano INT
AS

    SELECT Aluno, Disciplina 
    FROM Matricula
    WHERE YEAR(Data_Inicio) = @Ano AND Status_Aprovacao = 2;

GO