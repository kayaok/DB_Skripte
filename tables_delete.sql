--------------------------------------------------------------------------
-- Loeschen falls vorhanden
--------------------------------------------------------------------------

DROP TABLE kunden cascade constraints purge;
DROP TABLE krankenkassen cascade constraints purge;
DROP TABLE kundenkarten cascade constraints purge;
DROP TABLE kundenvertraege cascade constraints purge;
DROP TABLE mitarbeiter cascade constraints purge;
DROP TABLE trainer cascade constraints purge;
DROP TABLE arbeitseinteilung cascade constraints purge;
DROP TABLE arbeitsvertraege cascade constraints purge;
DROP TABLE kurse cascade constraints purge;
DROP TABLE individualplaene cascade constraints purge;
DROP TABLE durchfuehrungen cascade constraints purge;
DROP TABLE trainingsplaene cascade constraints purge;
DROP TABLE trainingseinheiten cascade constraints purge;
DROP TABLE kategorien cascade constraints purge;
DROP TABLE indi_durchfuehrungen cascade constraints purge;
DROP TABLE indi_trainingseinheit cascade constraints purge;
DROP TABLE sportgeraete cascade constraints purge;
DROP TABLE buchungsverlauf cascade constraints purge;
DROP TABLE kurse_kunden cascade constraints purge;
DROP TABLE kurse_trainer cascade constraints purge;
DROP TABLE kurse_traningseinheiten cascade constraints purge;
DROP TABLE mitarbeiter_arbeitseinteilung cascade constraints purge;
DROP TABLE mitarbeiter_arbeitsvertraege cascade constraints purge;
DROP TABLE trainingseinheiten_kategorien cascade constraints purge;