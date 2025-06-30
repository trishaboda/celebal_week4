WITH TB AS( SELECT s.Name, s.Marks, g.Grade FROM Students AS s 
           LEFT JOIN Grades AS g ON (s.Marks <=g.Max_Mark AND s.Marks >=g.Min_Mark) 
           ORDER BY g.Grade ) SELECT Name, Grade, Marks
FROM ( SELECT CASE WHEN Grade>=8 THEN Name ELSE 'NULL' END AS Name, Marks, Grade, CASE WHEN Grade<8 THEN Marks ELSE NULL END AS rk FROM TB ) AS TB4 ORDER BY Grade DESC, Name ASC, rk ASC;