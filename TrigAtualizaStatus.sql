ALTER TRIGGER TrigAtualizaStatus ON Matricula
AFTER UPDATE
AS
    DECLARE 
        @Aluno                      INT,
        @Disciplina                 VARCHAR(6),
        @Media_Aluno                DECIMAL(10, 2),
        @Frequencia_Aluno           DECIMAL(10, 2),
        @CargaHoraria_Disciplina    DECIMAL(10, 2)

        SELECT @Aluno = Aluno, @Disciplina = Disciplina, @Frequencia_Aluno = Frequencia, @Media_Aluno = Nota_Media FROM INSERTED
        SELECT @CargaHoraria_Disciplina = Carga_Horaria FROM Disciplina WHERE Codigo = @Disciplina;

    IF(UPDATE(Nota_Media))
    BEGIN

        IF (@Frequencia_Aluno <= (@CargaHoraria_Disciplina * 25)/100)
        BEGIN
            UPDATE Matricula
            SET Status_Aprovacao = 3
            WHERE Aluno = @Aluno AND Disciplina = @Disciplina;
        END

        ELSE IF(@Media_Aluno <= 5)
        BEGIN
            UPDATE Matricula
            SET Status_Aprovacao = 2
            WHERE Aluno = @Aluno AND Disciplina = @Disciplina;  
        END

        ELSE 
        BEGIN 
            UPDATE Matricula
            SET Status_Aprovacao = 1
            WHERE Aluno = @Aluno AND Disciplina = @Disciplina; 
        END
        
    END