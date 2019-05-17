SELECT DISTINCT pat.patientName, doc.DoctorName, doc.location
FROM (SELECT pe.firstname AS DoctorName, serialno AS ChipSerialNumber, location
FROM doctor dc, ((((person pe
INNER JOIN personchip pc ON pe.PERSONID = pc.PERSONID)
INNER JOIN chip c ON c.CHIPID = pc.CHIPID)
INNER JOIN chiplocation cl ON c.CHIPID = cl.CHIPID)
INNER JOIN location l ON l.LOCATIONID = cl.LOCATIONID)
WHERE pe.PERSONID = dc.PERSONID) doc INNER JOIN
(SELECT pe.firstname AS patientName, serialno AS ChipSerialNumber, location
FROM patient pa, ((((person pe
INNER JOIN personchip pc ON pe.PERSONID = pc.PERSONID)
INNER JOIN chip c ON c.CHIPID = pc.CHIPID)
INNER JOIN chiplocation cl ON c.CHIPID = cl.CHIPID)
INNER JOIN location l ON l.LOCATIONID = cl.LOCATIONID)
WHERE pe.PERSONID = pa.PERSONID) pat ON doc.location = pat.location
WHERE doc.location = pat.location
ORDER BY pat.patientName;