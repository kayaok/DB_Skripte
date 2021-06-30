--------------------------------------------------------------------------
-- Loeschen falls vorhanden
--------------------------------------------------------------------------

DROP TABLE kunden cascade constraints purge;
DROP TABLE krankenkassen cascade constraints purge;
DROP TABLE kundenkarten cascade constraints purge;
DROP TABLE kundenvertraege cascade constraints purge;
DROP TABLE mitarbeiter cascade constraints purge;
DROP TABLE trainer cascade constraints purge;
DROP TABLE arbeitseinteilungen cascade constraints purge;
DROP TABLE arbeitsvertraege cascade constraints purge;
DROP TABLE kurse cascade constraints purge;
DROP TABLE individualplaene cascade constraints purge;
DROP TABLE durchfuehrungen cascade constraints purge;
DROP TABLE trainingsplaene cascade constraints purge;
DROP TABLE trainingseinheiten cascade constraints purge;
DROP TABLE kategorien cascade constraints purge;
DROP TABLE indi_durchfuehrungen cascade constraints purge;
DROP TABLE sportgeraete cascade constraints purge;
DROP TABLE besteht_aus cascade constraints purge;
DROP TABLE buchungsverlaeufe cascade constraints purge;
DROP TABLE ist_definiert_durch cascade constraints purge;
DROP TABLE ist_teilnehmer cascade constraints purge;
DROP TABLE leitet_kurs cascade constraints purge;
DROP TABLE steht_unter_vertrag cascade constraints purge;
DROP TABLE wird_eingeteilt_in cascade constraints purge;
DROP TABLE vorausetzungen cascade constraints purge;