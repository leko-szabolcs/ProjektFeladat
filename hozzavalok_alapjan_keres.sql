USE [okosrecetkonyv]
GO
/****** Object:  StoredProcedure [dbo].[GetSearchRecipesByIngredients]    Script Date: 2024. 05. 15. 20:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetSearchRecipesByIngredients]
    (@hozzavalonev varchar(MAX))
AS
BEGIN
    -- Temporary table to hold the split ingredients
    CREATE TABLE #Ingredients (Nev varchar(100))

    -- Split the input string by comma and insert into the temporary table
    DECLARE @pos int, @nextpos int, @valuelen int
    SELECT @pos = 0, @nextpos = 1

    WHILE @nextpos > 0
    BEGIN
        SELECT @nextpos = CHARINDEX(',', @hozzavalonev, @pos + 1)
        SELECT @valuelen = CASE WHEN @nextpos > 0 THEN @nextpos ELSE LEN(@hozzavalonev) + 1 END - @pos - 1
        INSERT INTO #Ingredients (Nev) VALUES (LTRIM(RTRIM(SUBSTRING(@hozzavalonev, @pos + 1, @valuelen))))
        SELECT @pos = @nextpos
    END

    -- Select recipes that include all the ingredients
    SELECT R.Nev
    FROM RECEPT R
    INNER JOIN RECEPT_HOZZAVALO RH ON R.ID = RH.Recept_ID
    INNER JOIN HOZZAVALOK H ON RH.Hozzavalok_ID = H.ID
    WHERE H.Nev IN (SELECT Nev FROM #Ingredients)
    GROUP BY R.Nev
    HAVING COUNT(DISTINCT H.Nev) = (SELECT COUNT(*) FROM #Ingredients)

    -- Clean up
    DROP TABLE #Ingredients
END