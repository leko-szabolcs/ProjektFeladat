USE okosrecetkonyv
go
declare @input varchar(100)='csirkemell';

SELECT DISTINCT R.Nev AS ReceptNev
FROM RECEPT R
WHERE R.Nev = @input
UNION
SELECT DISTINCT R.Nev AS ReceptNev
FROM RECEPT R
INNER JOIN RECEPT_HOZZAVALO RH ON R.ID = RH.Recept_ID
INNER JOIN HOZZAVALOK H ON RH.Hozzavalok_ID = H.ID
WHERE H.Nev = @input;