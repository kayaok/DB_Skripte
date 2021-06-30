-- select k.NAME, t.TRAINER_ID
-- from KURSE k LEFT JOIN TRAINER t ON k.NAME
-- select  it.KUNDE_ID, t.TRAINER_ID, lk.TRAINER_ID, lk.KURS_ID,
-- from KURSE k, TRAINER t, IST_TEILNEHMER it LEFT JOIN LEITET_KURS lk ON lk.TRAINER_ID = t.TRAINER_ID
-- SELECT it.KUNDE_ID, COUNT(*) as c  FROM IST_TEILNEHMER it INNER JOIN LEITET_KURS lk ON lk.KURS_ID = it.KURS_ID
-- ORDER BY it.KUNDE_ID;
--
-- CREATE OR REPLACE VIEW woche_sporti (datum, trainingseinheit_tre, trainingseinheit_ind, sportgeraet) as
-- Select DATUM, ind.TRAININGSEINHEIT_ID, tre.TRAININGSEINHEIT_ID, SPORTGERAET_ID from INDI_DURCHFUEHRUNGEN ind
--                                                                                         INNER JOIN  TRAININGSEINHEITEN tre ON ind.TRAININGSEINHEIT_ID = tre.TRAININGSEINHEIT_ID
-- where ind.DATUM BETWEEN TO_DATE('2021-06-28', 'YYYY-MM-DD') AND TO_DATE('2021-07-04', 'YYYY-MM-DD')
-- --
create view AnzahlBesuche as
select STATUS, KUNDE_ID, NACHNAME
from BUCHUNGSVERLAEUFE bv join KUNDEN k on bv.KUNDENKARTE_ID = k.KUNDENKARTE_ID
where STATUS='CHECK-IN' and
extract(year from ZEITPUNKT)=2021 and
extract(month from ZEITPUNKT) between 3 and 3;
--

select  COUNT(*) "x", NAME
from MONATSKURS
where name is not null
GROUP BY NAME

