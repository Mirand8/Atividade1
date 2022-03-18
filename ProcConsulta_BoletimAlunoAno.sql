ALTER PROC BoletimAlunoAno @Aluno INT, @Ano INT
AS

    SELECT Disciplina, Nota_1, Nota_2, Nota_Media, Nota_Sub, Frequencia, Status_Aprovacao 
    FROM Matricula
    WHERE YEAR(Data_Inicio) = @Ano AND Aluno = @Aluno

GO