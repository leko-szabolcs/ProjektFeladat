CREATE PROCEDURE GetRecipeByNameAndCat
    (@megadottszoveg varchar(100))  
	AS  
	BEGIN    
		SELECT DISTINCT R.Nev, K.Kategorianev FROM [KATEGORIA] K INNER JOIN [RECEPT_KATEGORIA] RK ON K.ID=RK.Kategoria_ID INNER JOIN [RECEPT] R ON RK.Recept_ID=R.ID
		where  R.Nev like '%'+@megadottszoveg+'%' OR K.Kategorianev = @megadottszoveg
		ORDER BY R.Nev;
	END