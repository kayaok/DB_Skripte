-- 13.Erstelle ein Ranking mit zehn Kunden, die die meisten Bonuspunkten haben
select BONUSPUNKTE, vorname, NACHNAME
from KUNDENKARTEN kk join kunden k on kk.KUNDENKARTE_ID = k.KUNDENKARTE_ID
order by BONUSPUNKTE desc
fetch first 10 rows only;