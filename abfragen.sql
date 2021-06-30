-- 1.Prozentuales Verhaeltnis der verschiedenen Vertraege
SELECT VERTRAGSART, COUNT(VERTRAGSART) AS count, COUNT(VERTRAGSART)/SUM(COUNT(VERTRAGSART)) OVER() AS percentage
FROM KUNDENVERTRAEGE
GROUP BY VERTRAGSART
ORDER BY percentage desc;
-- 13.Erstelle ein Ranking mit zehn Kunden, die die meisten Bonuspunkten haben
select BONUSPUNKTE, vorname, NACHNAME
from KUNDENKARTEN kk join kunden k on kk.KUNDENKARTE_ID = k.KUNDENKARTE_ID
order by BONUSPUNKTE desc
fetch first 10 rows only;