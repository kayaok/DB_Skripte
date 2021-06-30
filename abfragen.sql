------------------------------------------------------------------------------------------------------------------------
-- Authors      Irem Belik, Till Greiffert, Okan Kaya
-- Created      30.06.2021
-- Purpose      creates all views needed for the fitnessstudio database
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
-- 1. prozentuales  verhältnis  der  verschiedenen  verträge  pro  jahr (basic, all inclusive, reha-sport  & schüler/student)
------------------------------------------------------------------------------------------------------------------------

SELECT vertragsart, COUNT(vertragsart) AS COUNT, COUNT(vertragsart) / SUM(COUNT(vertragsart)) over () AS percentage
FROM kundenvertraege
GROUP BY vertragsart
ORDER BY percentage DESC;

------------------------------------------------------------------------------------------------------------------------
-- 2. welches sportgerät erfährt die größte auslastung in der woche?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW woche_sporti (datum, trainingseinheit_tre, trainingseinheit_ind, sportgeraet) AS
SELECT datum, ind.trainingseinheit_id, tre.trainingseinheit_id, sportgeraet_id
FROM indi_durchfuehrungen ind
         INNER JOIN trainingseinheiten tre ON ind.trainingseinheit_id = tre.trainingseinheit_id
WHERE ind.datum BETWEEN to_date('2021-06-28', 'yyyy-mm-dd') AND to_date('2021-07-04', 'yyyy-mm-dd');
SELECT sportgeraet, COUNT(sportgeraet) AS COUNT
FROM woche_sporti
GROUP BY sportgeraet
ORDER BY COUNT DESC;

------------------------------------------------------------------------------------------------------------------------
-- 3. an welchen tagen sind die meisten trainierenden im studio?
------------------------------------------------------------------------------------------------------------------------

SELECT extract(DAY FROM zeitpunkt) "tag",
       COUNT(*)                    "besucher"
FROM buchungsverlaeufe
GROUP BY extract(DAY FROM zeitpunkt);

------------------------------------------------------------------------------------------------------------------------
-- 4. Anforderung Data Table
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW muskelgruppe_mvp AS
SELECT kategorien.muskelgruppe,sportgeraete.sportgeraet_id, COUNT(*) AS COUNT FROM trainingseinheiten
   JOIN ist_definiert_durch
        ON ist_definiert_durch.trainingseinheit_id = trainingseinheiten.trainingseinheit_id
   JOIN kategorien
        ON kategorien.kategorie_id = ist_definiert_durch.kategorie_id
   JOIN sportgeraete
        ON sportgeraete.sportgeraet_id = trainingseinheiten.sportgeraet_id
GROUP BY muskelgruppe,sportgeraete.sportgeraet_id;

------------------------------------------------------------------------------------------------------------------------
-- 5. gab es nach schnupperkursen mehr neuanmeldungen als davor?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW anmeldungen_n_schnupper AS
SELECT COUNT(kv.vertragsbeginn) AS vertragsabschluesse
FROM kurse k,
     ist_teilnehmer it
         JOIN kundenvertraege kv ON it.kunde_id = kv.kunde_id
WHERE k.name = 'schnupperkurs'
  AND kv.vertragsbeginn > k.ende;

CREATE OR REPLACE VIEW anmeldungen_v_schnupper AS
SELECT COUNT(kv.vertragsbeginn) AS vertragsabschluesse
FROM kurse k,
     ist_teilnehmer it
         JOIN kundenvertraege kv ON it.kunde_id = kv.kunde_id
WHERE k.name = 'schnupperkurs'
  AND kv.vertragsbeginn < k.ende;
SELECT vs.vertragsabschluesse AS vor_schnupperkurs, ns.vertragsabschluesse AS nach_schnupperkurs
FROM anmeldungen_n_schnupper ns,
     anmeldungen_v_schnupper vs;

------------------------------------------------------------------------------------------------------------------------
-- 6. wie ist die durchschnittliche belegung der kurse pro monat pro thema der kurse?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW monatskurs AS
SELECT extract(MONTH FROM beginn) "monat", kurse.name

FROM kunden
         LEFT JOIN ist_teilnehmer
                   ON kunden.kunde_id = ist_teilnehmer.kunde_id
         LEFT JOIN kurse
                   ON kurse.kurs_id = ist_teilnehmer.kurs_id;
SELECT COUNT(name) "anzahl", "monat", name
FROM monatskurs
WHERE name IS NOT NULL
GROUP BY "monat", name;

------------------------------------------------------------------------------------------------------------------------
-- 7.wie ist das verhältnis vON stammkunden (≥12 monate laufzeit) zu gelegenheitskunden (6 monate laufzeit) jeweils nach geschlecht?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW stammkundenverhaeltnis as
SELECT geschlecht, COUNT(geschlecht) / SUM(COUNT(geschlecht)) over () AS percentage
FROM kunden k
         JOIN kundenvertraege kv ON k.kunde_id = kv.kunde_id
WHERE vertragslaufzeit >= '12'
GROUP BY geschlecht
ORDER BY percentage DESC;

CREATE OR REPLACE VIEW gelegenheitskundenverhaeltnis as
SELECT geschlecht, COUNT(geschlecht) / SUM(COUNT(geschlecht)) over () AS percentage
FROM kunden k
         JOIN kundenvertraege kv ON k.kunde_id = kv.kunde_id
WHERE vertragslaufzeit = '6'
GROUP BY geschlecht
ORDER BY percentage DESC;

SELECT gelegenheitskunden.geschlecht,
       gelegenheitskunden.percentage AS gelegenheitskunden,
       stammkunden.geschlecht,
       stammkunden.percentage        AS stammkunden
FROM gelegenheitskundenverhaeltnis gelegenheitskunden,
     stammkundenverhaeltnis stammkunden;

------------------------------------------------------------------------------------------------------------------------
-- 8. wie ist die trainingsintensität in stunden pro altersgruppe?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW altersspanne as
SELECT trunc((current_date - ku.geburtsdatum) / 365) AS "age", trainingsdauer
FROM kunden ku
         LEFT JOIN individualplaene indv
                   ON ku.kunde_id = indv.kunde_id
         LEFT JOIN indi_durchfuehrungen idurch
                   ON idurch.individualplan_id = indv.individualplan_id
         LEFT JOIN trainingseinheiten train
                   ON train.trainingseinheit_id = idurch.trainingseinheit_id;
SELECT TRUNC(SUM(trainingsdauer) / 60) AS "trainingsdauer in S.", "age"
FROM altersspanne
GROUP BY "age";

------------------------------------------------------------------------------------------------------------------------
-- 9. anteil der trainingsstunden von kunden, die eine reha-therapie erhalten?
------------------------------------------------------------------------------------------------------------------------

SELECT TRUNC(SUM(trainingsdauer) / 60)
FROM kunden ku
         LEFT JOIN individualplaene indv
                   ON ku.kunde_id = indv.kunde_id
         LEFT JOIN indi_durchfuehrungen idurch
                   ON idurch.individualplan_id = indv.individualplan_id
         LEFT JOIN trainingseinheiten train
                   ON train.trainingseinheit_id = idurch.trainingseinheit_id
         LEFT JOIN kundenvertraege kuv
                   ON kuv.kunde_id = ku.kunde_id
WHERE kuv.vertragsart = 'reha-sport';

------------------------------------------------------------------------------------------------------------------------
-- 10. wie ist die verteilung der kunden nach plz-region pro jahr?
------------------------------------------------------------------------------------------------------------------------

SELECT plz, COUNT(plz) / SUM(COUNT(plz)) over () AS percentage
FROM kunden k
         JOIN kundenvertraege kv ON k.kunde_id = kv.kunde_id
WHERE extract(year FROM vertragsbeginn) = 2019
GROUP BY plz
ORDER BY percentage DESC;

SELECT plz, COUNT(plz) / SUM(COUNT(plz)) over () AS percentage
FROM kunden k
         JOIN kundenvertraege kv ON k.kunde_id = kv.kunde_id
WHERE vertragsbeginn BETWEEN to_date('01/01/2019', 'dd/mm/yyyy') and to_date('31/12/2020', 'dd/mm/yyyy')
GROUP BY plz
ORDER BY percentage DESC;

SELECT plz, COUNT(plz) / SUM(COUNT(plz)) over () AS percentage
FROM kunden k
         JOIN kundenvertraege kv ON k.kunde_id = kv.kunde_id
WHERE vertragsbeginn BETWEEN to_date('01/01/2019', 'dd/mm/yyyy') and to_date('31/12/2021', 'dd/mm/yyyy')
GROUP BY plz
ORDER BY percentage DESC;

------------------------------------------------------------------------------------------------------------------------
-- 11. liste alle kunden auf, die im märz das studio besucht haben sowie die häufigkeit in absteigender reihenfolge
------------------------------------------------------------------------------------------------------------------------

create view AnzahlBesuche as
select STATUS, KUNDE_ID, NACHNAME
from BUCHUNGSVERLAEUFE bv join KUNDEN k on bv.KUNDENKARTE_ID = k.KUNDENKARTE_ID
where STATUS='CHECK-IN' and
        extract(year from ZEITPUNKT)=2021 and
    extract(month from ZEITPUNKT) between 3 and 3;
SELECT kunde_id, COUNT(kunde_id) AS anzahlbesuche
FROM anzahlbesuche
GROUP BY kunde_id
ORDER BY anzahlbesuche DESC;

------------------------------------------------------------------------------------------------------------------------
-- 12. durchschnittliche trainingsdauer eines kunden pro tag?
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW drchschntt_training as
SELECT SUM(trainingsdauer) AS SUM_training, ku.kunde_id, idurch.datum
FROM kunden ku
         LEFT JOIN individualplaene indv
                   ON ku.kunde_id = indv.kunde_id
         LEFT JOIN indi_durchfuehrungen idurch
                   ON idurch.individualplan_id = indv.individualplan_id
         LEFT JOIN trainingseinheiten train
                   ON train.trainingseinheit_id = idurch.trainingseinheit_id
         LEFT JOIN kundenvertraege kuv
                   ON kuv.kunde_id = ku.kunde_id
GROUP BY idurch.datum, ku.kunde_id;
SELECT  trunc(SUM(SUM_training)/COUNT(*))
FROM drchschntt_training;

------------------------------------------------------------------------------------------------------------------------
-- 13.erstelle ein ranking mit zehn kunden, die die meisten bonuspunkten haben
------------------------------------------------------------------------------------------------------------------------

SELECT bonuspunkte, vorname, nachname
FROM kundenkarten kk
         JOIN kunden k ON kk.kundenkarte_id = k.kundenkarte_id
ORDER BY bonuspunkte DESC
    FETCH FIRST 10 ROWS ONLY;

------------------------------------------------------------------------------------------------------------------------
-- 14. welcher mitarbeiter ist am häufigsten pro arbeitseinteilung eingeteilt?
------------------------------------------------------------------------------------------------------------------------

SELECT wei.mitarbeiter_id, COUNT(wei.mitarbeiter_id) AS anzahl
FROM wird_eingeteilt_in wei
GROUP BY mitarbeiter_id
ORDER BY anzahl DESC;

------------------------------------------------------------------------------------------------------------------------
-- 15. beliebteste kurse pro trainer?
------------------------------------------------------------------------------------------------------------------------

SELECT lk.trainer_id, COUNT(kunde_id) AS kunden
FROM leitet_kurs lk
         JOIN ist_teilnehmer it ON lk.kurs_id = it.kurs_id
GROUP BY trainer_id
ORDER BY kunden DESC;