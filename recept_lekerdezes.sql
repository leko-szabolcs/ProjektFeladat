use okosrecetkonyv
go
SELECT 
    R.Nev AS 'ReceptNev',
    H.Nev AS 'HozzavaloNev',
    M.Nev AS 'Mertekegyseg',
    RH.Mennyiseg AS 'Mennyiseg'
FROM 
    RECEPT R
JOIN 
    RECEPT_HOZZAVALO RH ON R.ID = RH.Recept_ID
JOIN 
    HOZZAVALOK H ON RH.Hozzavalok_ID = H.ID
JOIN 
    MERTEKEGYSEG M ON RH.Mertekegyseg_ID = M.ID
WHERE 
    R.Nev LIKE '%Mac%'; 

use okosrecetkonyv
go
SELECT 
    R.Leiras AS 'ReceptLeiras',
    K.Kep AS 'ReceptKep'
FROM 
    RECEPT R
JOIN 
    KEP K ON R.Kep_ID = K.ID
WHERE 
    R.Nev LIKE '%Mac%'
