CREATE PROCEDURE AtualizaNota 
@Disciplina VARCHAR(6), @Aluno INT, @Nota INT, @Valor_Nota DECIMAL(10,2), @Frequencia DECIMAL(10,2)
AS

IF (@Nota = 1)
    BEGIN
        UPDATE Matricula
        SET Nota_1 = @Valor_Nota
        WHERE Disciplina = @Disciplina AND Aluno = @Aluno;
    END

ELSE IF (@Nota = 2)
    BEGIN
        UPDATE Matricula
        SET Nota_2 = @Valor_Nota
        WHERE Disciplina = @Disciplina AND Aluno = @Aluno;

        UPDATE Matricula
        SET Nota_Media = ( (SELECT Nota_1) + (SELECT Nota_2) ) /2
        WHERE Disciplina = @Disciplina AND Aluno = @Aluno;
    END

ELSE
    BEGIN
        UPDATE Matricula
        SET Nota_Sub = @Valor_Nota
        WHERE Disciplina = @Disciplina AND Aluno = @Aluno;
    END

UPDATE Matricula
SET Frequencia = @Frequencia
WHERE Disciplina = @Disciplina AND Aluno = @Aluno;

GO