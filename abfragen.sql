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

-- 5. Schnupperkurs Anmeldung
Create View anmeldungen_n_schnupper as
Select COUNT(kv.VERTRAGSBEGINN)  as Vertragsabschluesse
From Kurse k, IST_TEILNEHMER it JOIN KUNDENVERTRAEGE kv on it.KUNDE_ID = kv.KUNDE_ID
where k.NAME = 'Schnupperkurs' AND kv.VERTRAGSBEGINN > k.ENDE;
Create View anmeldungen_v_schnupper as
Select COUNT(kv.VERTRAGSBEGINN) as Vertragsabschluesse
From Kurse k, IST_TEILNEHMER it JOIN KUNDENVERTRAEGE kv on it.KUNDE_ID = kv.KUNDE_ID
where k.NAME = 'Schnupperkurs' AND kv.VERTRAGSBEGINN < k.ENDE;
SELECT vs.VERTRAGSABSCHLUESSE as vor_schnupperkurs, ns.VERTRAGSABSCHLUESSE as nach_schnupperkurs
from ANMELDUNGEN_N_SCHNUPPER nS, ANMELDUNGEN_V_SCHNUPPER vS;

--7.Wie ist das Verhältnis von Stammkunden (≥12 Monate Laufzeit) zu Gelegenheitskunden (6 Monate Laufzeit) jeweils nach Geschlecht?
Create View stammkundenVerhaeltnis as
select GESCHLECHT, COUNT(GESCHLECHT)/SUM(COUNT(GESCHLECHT)) OVER() AS percentage
from KUNDEN k join KUNDENVERTRAEGE kv on k.KUNDE_ID = kv.KUNDE_ID
where VERTRAGSLAUFZEIT >= '12'
GROUP BY GESCHLECHT
ORDER BY percentage desc;

Create View gelegenheitskundenVerhaeltnis as
select GESCHLECHT, COUNT(GESCHLECHT)/SUM(COUNT(GESCHLECHT)) OVER() AS percentage
from KUNDEN k join KUNDENVERTRAEGE kv on k.KUNDE_ID = kv.KUNDE_ID
where VERTRAGSLAUFZEIT = '6'
GROUP BY GESCHLECHT
ORDER BY percentage desc;

SELECT gelegenheitskunden.GESCHLECHT,gelegenheitskunden.percentage as gelegenheitskunden,
       stammkunden.GESCHLECHT, stammkunden.percentage as stammkunden
from gelegenheitskundenVerhaeltnis gelegenheitskunden, stammkundenVerhaeltnis stammkunden;

--10.Wie ist die Verteilung der Kundennach PLZ-Region pro Jahr?
SELECT PLZ, COUNT(PLZ)/SUM(COUNT(PLZ)) OVER() AS percentage
FROM KUNDEN k join KUNDENVERTRAEGE kv on k.KUNDE_ID = kv.KUNDE_ID
where extract(year from VERTRAGSBEGINN)=2019
GROUP BY PLZ
ORDER BY percentage desc;

SELECT PLZ, COUNT(PLZ)/SUM(COUNT(PLZ)) OVER() AS percentage
FROM KUNDEN k join KUNDENVERTRAEGE kv on k.KUNDE_ID = kv.KUNDE_ID
where VERTRAGSBEGINN BETWEEN TO_DATE('01/01/2019', 'DD/MM/YYYY') AND TO_DATE('31/12/2020', 'DD/MM/YYYY')
GROUP BY PLZ
ORDER BY percentage desc;

SELECT PLZ, COUNT(PLZ)/SUM(COUNT(PLZ)) OVER() AS percentage
FROM KUNDEN k join KUNDENVERTRAEGE kv on k.KUNDE_ID = kv.KUNDE_ID
where VERTRAGSBEGINN BETWEEN TO_DATE('01/01/2019', 'DD/MM/YYYY') AND TO_DATE('31/12/2021', 'DD/MM/YYYY')
GROUP BY PLZ
ORDER BY percentage desc;

--11.Welche Kunden haben das Studio im Monat März am meisten besucht?
select KUNDE_ID, count(KUNDE_ID) as anzahlBesuche
from AnzahlBesuche
group by KUNDE_ID
order by anzahlBesuche desc
fetch first 3 rows only;

-- 13.Erstelle ein Ranking mit zehn Kunden, die die meisten Bonuspunkten haben
select BONUSPUNKTE, vorname, NACHNAME
from KUNDENKARTEN kk join kunden k on kk.KUNDENKARTE_ID = k.KUNDENKARTE_ID
order by BONUSPUNKTE desc
fetch first 10 rows only;

-- 14. Mitarbeiter haeufigste Arbeitseinteilung
select wei.MITARBEITER_ID, count(wei.MITARBEITER_ID) as anzahl
from WIRD_EINGETEILT_IN wei
group by MITARBEITER_ID
order by anzahl desc;

-- 15. Trainer mit den meisten Kurs-Teilnehmern
select lk.TRAINER_ID, COUNT(KUNDE_ID) as KUNDEN
from LEITET_KURS lk JOIN IST_TEILNEHMER it on lk.KURS_ID = it.KURS_ID
group by TRAINER_ID
order by KUNDEN desc;