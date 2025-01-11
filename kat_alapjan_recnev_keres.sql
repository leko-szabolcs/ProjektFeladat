CREATE PROCEDURE GetRecipeNamesByCategory
    (@kategorianev varchar(100))  
	AS  
	BEGIN    
		SELECT R.Nev FROM [KATEGORIA] K INNER JOIN [RECEPT_KATEGORIA] RK ON K.ID=RK.Kategoria_ID INNER JOIN [RECEPT] R ON RK.Recept_ID=R.ID
		WHERE Kategorianev = @kategorianev;
	END