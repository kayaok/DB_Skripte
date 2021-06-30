-- 1.Prozentuales Verhaeltnis der verschiedenen Vertraege
SELECT VERTRAGSART, COUNT(VERTRAGSART) AS count, COUNT(VERTRAGSART)/SUM(COUNT(VERTRAGSART)) OVER() AS percentage
FROM KUNDENVERTRAEGE
GROUP BY VERTRAGSART
ORDER BY percentage desc;
-- 2. Sportgeraete Auslastung
CREATE OR REPLACE VIEW woche_sporti (datum, trainingseinheit_tre, trainingseinheit_ind, sportgeraet) as
Select DATUM, ind.TRAININGSEINHEIT_ID, tre.TRAININGSEINHEIT_ID, SPORTGERAET_ID from INDI_DURCHFUEHRUNGEN ind
INNER JOIN  TRAININGSEINHEITEN tre ON ind.TRAININGSEINHEIT_ID = tre.TRAININGSEINHEIT_ID
where ind.DATUM BETWEEN TO_DATE('2021-06-28', 'YYYY-MM-DD') AND TO_DATE('2021-07-04', 'YYYY-MM-DD');
select SPORTGERAET, count(SPORTGERAET) as count from WOCHE_SPORTI group by SPORTGERAET order by count desc;
-- 13.Erstelle ein Ranking mit zehn Kunden, die die meisten Bonuspunkten haben
select BONUSPUNKTE, vorname, NACHNAME
from KUNDENKARTEN kk join kunden k on kk.KUNDENKARTE_ID = k.KUNDENKARTE_ID
order by BONUSPUNKTE desc
fetch first 10 rows only;