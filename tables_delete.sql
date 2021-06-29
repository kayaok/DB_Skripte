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
DROP TABLE BUCHUNGSVERLAEUFE cascade constraints purge;
DROP TABLE IST_DEFINIERT_DURCH cascade constraints purge;
DROP TABLE IST_TEILNEHMER cascade constraints purge;
DROP TABLE LEITET_KURS cascade constraints purge;
DROP TABLE STEHT_UNTER_VERTRAG cascade constraints purge;
DROP TABLE WIRD_EINGETEILT_IN cascade constraints purge;
