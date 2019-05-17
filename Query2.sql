SELECT pe.firstname AS patname, pe.lastname AS patsur, l.location AS ward, cl.ENTRYDATE AS de
FROM patient pa, ((((person pe
INNER JOIN personchip pc ON pe.personID = pc.PERSONID)
INNER JOIN chip c ON c.CHIPID = pc.CHIPID)
INNER JOIN chiplocation cl ON c.CHIPID = cl.CHIPID)
INNER JOIN location l ON l.LOCATIONID = cl.LOCATIONID)
WHERE pe.PERSONID = pa.PERSONID
AND l.LOCATION = '&WARDNAME' AND cl.ENTRYDATE = '&DATE_ENTRY'
ORDER BY pe.name;