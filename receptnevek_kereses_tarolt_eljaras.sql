 
 
	CREATE PROCEDURE GetRecipeNames
    (@receptnev varchar(100))  
	AS  
	BEGIN    
		SELECT * FROM [RECEPT] WHERE Nev like '%'+@receptnev+'%' 
	END