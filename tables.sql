--------------------------------------------------------------------------
-- Create Table Kunden
--------------------------------------------------------------------------

CREATE TABLE kunden
(
    kunde_id              CHAR(5) --k_000
        CONSTRAINT kunde_id_nn NOT NULL,
    vorname              VARCHAR(20)
        CONSTRAINT kunde_vorname_nn NOT NULL,
    nachname              VARCHAR(20)
        CONSTRAINT kunde_nachname_nn NOT NULL,
    geschlecht            CHAR
        CONSTRAINT kunde_geschlecht_nn NOT NULL,
    geburtsdatum          DATE
        CONSTRAINT kunde_geburtsdatum_nn NOT NULL,
    strasse_hn               VARCHAR(30)
        CONSTRAINT kunde_shn_nn NOT NULL,
    plz                   VARCHAR(5)
        CONSTRAINT kunde_plz_nn NOT NULL,
    ort                   VARCHAR(20)
        CONSTRAINT kunde_ort_nn NOT NULL,
    telefonnummer         VARCHAR(20),
    email                 VARCHAR(40),
    kontonummer           VARCHAR(25)
        CONSTRAINT kunde_kontonummer_nn NOT NULL,
    bank                  VARCHAR(50)
        CONSTRAINT kunde_bank_nn NOT NULL,
    iban                  VARCHAR(20)
        CONSTRAINT kunde_iban_nn NOT NULL,
    bic                   VARCHAR(15)
        CONSTRAINT kunde_bic_nn NOT NULL,
    kk_nummer                   NUMBER
        CONSTRAINT kunde_kk_nummer_nn NOT NULL,
    kundenkarte_id        CHAR(6),
    krankenkasse_id       CHAR(5),
    trainer_id            CHAR(4)
);

CREATE UNIQUE INDEX kunde_id_pk ON
    kunden (
            kunde_id
        );

ALTER TABLE kunden
    ADD (
        CONSTRAINT kunde_id_pk PRIMARY KEY (kunde_id)
        );

--------------------------------------------------------------------------
-- Create Table Krankenkassen
--------------------------------------------------------------------------

CREATE TABLE krankenkassen
(
    krankenkasse_id          CHAR(5) --kk_00
        CONSTRAINT krankenkasse_id_nn NOT NULL,
    name                     VARCHAR(30)
        CONSTRAINT krankenkasse_name_nn NOT NULL,
    strasse_hn                 VARCHAR(30)
        CONSTRAINT krankenkasse_strasse_nn NOT NULL,
    plz                      VARCHAR(5)
        CONSTRAINT krankenkasse_plz_nn NOT NULL,
    ort                      VARCHAR(20)
        CONSTRAINT krankenkasse_ort_nn NOT NULL,
    telefonnummer            VARCHAR(20),
    email                    VARCHAR(40),
    ansprechpartner_name  VARCHAR(20)
        CONSTRAINT krankenkasse_ap_name_nn NOT NULL
);

CREATE UNIQUE INDEX krankenkasse_id_pk ON
    krankenkassen (
                   krankenkasse_id
        );

ALTER TABLE krankenkassen
    ADD (
        CONSTRAINT krankenkasse_id_pk PRIMARY KEY (krankenkasse_id)
        );

--------------------------------------------------------------------------
-- Create Table Kundenkarten
--------------------------------------------------------------------------

CREATE TABLE kundenkarten
(
    kundenkarte_id  CHAR(6) --cc_000
        CONSTRAINT kundenkarte_id_nn NOT NULL,
    bonuspunkte     NUMBER
        CONSTRAINT kundenkarte_bonuspunkte_nn NOT NULL,
    status          NUMBER
        CONSTRAINT kundenkarte_status_nn NOT NULL
);

CREATE UNIQUE INDEX kundenkarte_id_pk ON
    kundenkarten (
                  kundenkarte_id
        );

ALTER TABLE kundenkarten
    ADD (
        CONSTRAINT kundenkarte_id_pk PRIMARY KEY (kundenkarte_id)
        );

--------------------------------------------------------------------------
-- Create Table Buchungsverlauf
--------------------------------------------------------------------------

CREATE TABLE buchungsverlauf
(
    buchungsverlauf_id  CHAR(7) --bv_0000
        CONSTRAINT buchungsverlauf_id_nn NOT NULL,
    zeitpunkt DATE
        CONSTRAINT buchungsverlauf_zeitpunkt_nn NOT NULL,
    kundenkarte_id CHAR(6)
);

CREATE UNIQUE INDEX bunchungsverlauf_id_pk ON
    buchungsverlauf (
                  buchungsverlauf_id
        );

ALTER TABLE buchungsverlauf
    ADD (
        CONSTRAINT buchungsverlauf_id_pk PRIMARY KEY (buchungsverlauf_id)
        );

--------------------------------------------------------------------------
-- Create Table Kundenvertraege
--------------------------------------------------------------------------

CREATE TABLE kundenvertraege
(
    kundenvertrag_id CHAR(6) --kv_000
        CONSTRAINT kundenvertrag_id_nn NOT NULL,
    vertragsart      VARCHAR(20)
        CONSTRAINT kundenvertrag_vertragsart_nn NOT NULL,
    vertragsbeginn   DATE
        CONSTRAINT kundenvertrag_vbeginn_nn NOT NULL,
    vertragslaufzeit NUMBER
        CONSTRAINT kundenvertrag_laufzeit_nn NOT NULL,
    beitrag          DECIMAL(4, 2)
        CONSTRAINT kundenvertrag_beitrag_nn NOT NULL,
    zusatz_gebuehren DECIMAL(4, 2)
        CONSTRAINT kundenvertrag_zg_nn NOT NULL,
    kunde_id         CHAR(5)
);

CREATE UNIQUE INDEX kundenvertrag_id_pk ON
    kundenvertraege (
                     kundenvertrag_id
        );

ALTER TABLE kundenvertraege
    ADD (
        CONSTRAINT kundenvertrag_id_pk PRIMARY KEY (kundenvertrag_id)
        );

--------------------------------------------------------------------------
-- Create Table Mitarbeiter
--------------------------------------------------------------------------

CREATE TABLE mitarbeiter
(
    mitarbeiter_id        CHAR(4) --m_00
        CONSTRAINT mitarbeiter_id_nn NOT NULL,
    vorname               VARCHAR(20)
        CONSTRAINT mitarbeiter_vorname_nn NOT NULL,
    nachname               VARCHAR(20)
        CONSTRAINT mitarbeiter_nachname_nn NOT NULL,
    geschlecht            CHAR
        CONSTRAINT mitarbeiter_geschlecht_nn NOT NULL,
    geburtsdatum          DATE
        CONSTRAINT mitarbeiter_geburtsdatum_nn NOT NULL,
    strasse_hn              VARCHAR(20)
        CONSTRAINT mitarbeiter_shn_nn NOT NULL,
    plz                   VARCHAR(5)
        CONSTRAINT mitarbeiter_plz_nn NOT NULL,
    ort                   VARCHAR(20)
        CONSTRAINT mitarbeiter_ort_nn NOT NULL,
    telefonnummer         VARCHAR(20),
    firmeneintritt        DATE
        CONSTRAINT mitarbeiter_eintritt_nn NOT NULL,
    kontonummer           VARCHAR(25)
        CONSTRAINT mitarbeiter_kontonummer_nn NOT NULL,
    bank                  VARCHAR(20)
        CONSTRAINT mitarbeiter_bank_nn NOT NULL,
    iban                  VARCHAR(20)
        CONSTRAINT mitarbeiter_iban_nn NOT NULL,
    bic                   VARCHAR(15)
        CONSTRAINT mitarbeiter_bic_nn NOT NULL
);

CREATE UNIQUE INDEX mitarbeiter_id_pk ON
    mitarbeiter (
                 mitarbeiter_id
        );

ALTER TABLE mitarbeiter
    ADD (
        CONSTRAINT mitarbeiter_id_pk PRIMARY KEY (mitarbeiter_id)
        );

--------------------------------------------------------------------------
-- Create Table Trainer
--------------------------------------------------------------------------

CREATE TABLE trainer
(
    trainer_id     CHAR(4) -- t_00
        CONSTRAINT trainer_id_nn NOT NULL,
    trainer_lizenz CHAR
        CONSTRAINT trainer_lizenz_nn NOT NULL,
    mitarbeiter_id CHAR(4)
);

CREATE UNIQUE INDEX trainer_id_pk ON
    trainer (
             trainer_id
        );

ALTER TABLE trainer
    ADD (
        CONSTRAINT trainer_id_pk PRIMARY KEY (trainer_id)
        );

--------------------------------------------------------------------------
-- Create Table Arbeitseinteilung
--------------------------------------------------------------------------

CREATE TABLE arbeitseinteilung
(
    arbeitseinteilung_id CHAR(6) --ae_000
        CONSTRAINT ae_id_nn NOT NULL,
    beginn               TIMESTAMP
        CONSTRAINT ae_beginn_nn NOT NULL,
    ende                 TIMESTAMP
        CONSTRAINT ae_ende_nn NOT NULL,
    datum                DATE
        CONSTRAINT ae_datum_nn NOT NULL
);

CREATE UNIQUE INDEX arbeitseinteilung_id_pk ON
    arbeitseinteilung (
                       arbeitseinteilung_id
        );

ALTER TABLE arbeitseinteilung
    ADD (
        CONSTRAINT arbeitseinteilung_id_pk PRIMARY KEY (arbeitseinteilung_id)
        );

--------------------------------------------------------------------------
-- Create Table Arbeitsvertrag
--------------------------------------------------------------------------

CREATE TABLE arbeitsvertraege
(
    arbeitsvertrag_id CHAR(5) --av_00
        CONSTRAINT arbeitsvertrag_id_nn NOT NULL,
    vertragslaufzeit  NUMBER
        CONSTRAINT arbeitsvertrag_laufzeit_nn NOT NULL,
    gehalt            DECIMAL(9, 2)
        CONSTRAINT gehalt_nn NOT NULL,
    position          varchar(15),
    arbeitszeit       NUMBER
        CONSTRAINT arbeitszeit_nn NOT NULL


);

CREATE UNIQUE INDEX arbeitsvertrag_id_pk ON
    arbeitsvertraege (
                      arbeitsvertrag_id
        );

ALTER TABLE arbeitsvertraege
    ADD (
        CONSTRAINT arbeitsvertrag_id_pk PRIMARY KEY (arbeitsvertrag_id)
        );

--------------------------------------------------------------------------
-- Create Table Kurse
--------------------------------------------------------------------------

CREATE TABLE kurse
(
    kurs_id    CHAR(6) -- krs_00
        CONSTRAINT kurs_id_nn NOT NULL,
    name       varchar(20)
        CONSTRAINT kurs_name_nn NOT NULL,
    dauer      NUMBER,
    teilnehmer NUMBER,
    beginn     DATE
        CONSTRAINT kurs_beginn_nn NOT NULL,
    ende       DATE
        CONSTRAINT kurs_ende_nn NOT NULL
);

CREATE UNIQUE INDEX kurs_id_pk ON
    kurse (
           kurs_id
        );

ALTER TABLE kurse
    ADD (
        CONSTRAINT kurs_id_pk PRIMARY KEY (kurs_id)
        );

--------------------------------------------------------------------------
-- Create Table Individualplaene
--------------------------------------------------------------------------

CREATE TABLE individualplaene
(
    individualplan_id     CHAR(7) --ivp_000
        CONSTRAINT individualplan_id_nn NOT NULL,
    beginn                DATE
        CONSTRAINT individualplan_beginn_nn NOT NULL,
    tatsaechlicher_beginn DATE,
    ende                  DATE,
    trainingsplan_id      CHAR(6)
);

CREATE UNIQUE INDEX individualplan_id_pk ON
    individualplaene (
                      individualplan_id
        );

ALTER TABLE individualplaene
    ADD (
        CONSTRAINT individualplan_id_pk PRIMARY KEY (individualplan_id)
        );



--------------------------------------------------------------------------
-- Create Table Durchfuehrung
--------------------------------------------------------------------------

CREATE TABLE durchfuehrungen
(
    durchfuehrung_id    CHAR(7) --drf_000
        CONSTRAINT durchfuehrung_id_nn NOT NULL,
    intensitaet         NUMBER
        CONSTRAINT intensitaet_nn NOT NULL,
    wiederholungen      NUMBER
        CONSTRAINT wiederholungen_nn NOT NULL,
    saetze              NUMBER
        CONSTRAINT saetze_nn NOT NULL,
    pausen              NUMBER
        CONSTRAINT pausen_nn NOT NULL,
    nummer              NUMBER
        CONSTRAINT nummer_nn NOT NULL,
    trainingseinheit_id CHAR(5)
);

CREATE UNIQUE INDEX durchfuehrung_id_pk ON
    durchfuehrungen (
                     durchfuehrung_id
        );

ALTER TABLE durchfuehrungen
    ADD (
        CONSTRAINT durchfuehrung_id_pk PRIMARY KEY (durchfuehrung_id)
        );

--------------------------------------------------------------------------
-- Create Table Trainingsplaene
--------------------------------------------------------------------------

CREATE TABLE trainingsplaene
(
    trainingsplan_id  CHAR(6) --trp_00
        CONSTRAINT trainingsplan_id_nn NOT NULL,
    name              VARCHAR(20)
        CONSTRAINT trainingsplan_name_nn NOT NULL,
    schwierigkeit     NUMBER
        CONSTRAINT trainingsplan_schwierigkeit_nn NOT NULL,
    trainingszeitraum NUMBER
        CONSTRAINT trainingsplan_tz_nn NOT NULL
);

CREATE UNIQUE INDEX trainingsplan_id_pk ON
    trainingsplaene (
                     trainingsplan_id
        );

ALTER TABLE trainingsplaene
    ADD (
        CONSTRAINT trainingsplan_id_pk PRIMARY KEY (trainingsplan_id)
        );

--------------------------------------------------------------------------
-- Create Table Trainingseinheiten
--------------------------------------------------------------------------

CREATE TABLE trainingseinheiten
(
    trainingseinheit_id CHAR(5) --te_00
        CONSTRAINT trainingseinheit_id_nn NOT NULL,
    name                varchar(20)
        CONSTRAINT name_nn NOT NULL,
    trainingsdauer      NUMBER
        CONSTRAINT trainingseinheit_td_nn NOT NULL,
    empfohleneTage      NUMBER
        CONSTRAINT trainingseinheit_et_nn NOT NULL,
    hinweise            varchar(300),
    sportgeraet_id      CHAR(6)
);

CREATE UNIQUE INDEX trainingseinheit_id_pk ON
    trainingseinheiten (
                        trainingseinheit_id
        );

ALTER TABLE trainingseinheiten
    ADD (
        CONSTRAINT trainingseinheit_id_pk PRIMARY KEY (trainingseinheit_id)
        );

--------------------------------------------------------------------------
-- Create Table Sportgeraete
--------------------------------------------------------------------------

CREATE TABLE sportgeraete
(
    sportgeraet_id     CHAR(6) -- sg_000
        CONSTRAINT sportgeraet_id_nn NOT NULL,
    name               VARCHAR(30)
        CONSTRAINT sportgeraet_name_nn NOT NULL,
    hersteller         VARCHAR(20)
        CONSTRAINT sportgeraet_hersteller_nn NOT NULL,
    seriennummer       VARCHAR(15)
        CONSTRAINT sportgeraet_seriennummer_nn NOT NULL,
    anschaffungsdatum  DATE
        CONSTRAINT sportgeraet_ad_nn NOT NULL,
    garantie           DATE
        CONSTRAINT sportgeraet_garantie_nn NOT NULL,
    anschaffungskosten DATE
        CONSTRAINT sportgeraet_ak_nn NOT NULL,
    e_gym              CHAR(1)
        CONSTRAINT sportgeraet_eg_nn NOT NULL
);

CREATE UNIQUE INDEX sportgeraet_id_pk ON
    sportgeraete (
                  sportgeraet_id
        );

ALTER TABLE sportgeraete
    ADD (
        CONSTRAINT sportgeraet_id_pk PRIMARY KEY (sportgeraet_id)
        );


--------------------------------------------------------------------------
-- Create Table Kategorien
--------------------------------------------------------------------------

CREATE TABLE kategorien
(
    kategorie_id CHAR(6) --kat_00
        CONSTRAINT kategorie_id_nn NOT NULL,
    bezeichnung  VARCHAR(30)
        CONSTRAINT kategorie_bezeichnung_nn NOT NULL,
    muskelgruppe VARCHAR(30)
);

CREATE UNIQUE INDEX kategorie_id_pk ON
    kategorien (
                kategorie_id
        );

ALTER TABLE kategorien
    ADD (
        CONSTRAINT kategorie_id_pk PRIMARY KEY (kategorie_id)
        );

--------------------------------------------------------------------------
-- Create Table individuelle Durchfuehrung
--------------------------------------------------------------------------

CREATE TABLE indi_durchfuehrungen
(
    indi_durchfuehrung_id CHAR(9) --idrf_0000
        CONSTRAINT indi_durchfuehrung_id_nn NOT NULL,
    indi_intensitaet      NUMBER
        CONSTRAINT indi_intensitaet_nn NOT NULL,
    indi_wiederholungen   NUMBER
        CONSTRAINT indi_wiederholungen_nn NOT NULL,
    indi_saetze           NUMBER
        CONSTRAINT indi_saetze_nn NOT NULL,
    indi_pausen           NUMBER
        CONSTRAINT indi_pausen_nn NOT NULL,
    datum                 DATE
        CONSTRAINT indi_datum_nn NOT NULL
);

CREATE UNIQUE INDEX indi_durchfuehrung_id_pk ON
    indi_durchfuehrungen (
                          indi_durchfuehrung_id
        );

ALTER TABLE indi_durchfuehrungen
    ADD (
        CONSTRAINT indi_durchfuehrung_id_pk PRIMARY KEY (indi_durchfuehrung_id)
        );

--------------------------------------------------------------------------
-- Create Table individuelle Trainingseinheit
--------------------------------------------------------------------------

CREATE TABLE indi_trainingseinheit
(
    indi_trainingseinheit_id CHAR(8) --ite_0000
        CONSTRAINT indi_trainingseinheit_id_nn NOT NULL,
    indi_trainingsdauer      NUMBER
        CONSTRAINT indi_trainingsdauer_nn NOT NULL,
    indi_empfohleneTage      NUMBER
        CONSTRAINT indi_et_nn NOT NULL
);

CREATE UNIQUE INDEX indi_trainingseinheit_id_pk ON
    indi_trainingseinheit (
                           indi_trainingseinheit_id
        );

ALTER TABLE indi_trainingseinheit
    ADD (
        CONSTRAINT indi_trainingseinheit_id_pk PRIMARY KEY (indi_trainingseinheit_id)
        );

--------------------------------------------------------------------------
-- ADD Foreign Keys
--------------------------------------------------------------------------

ALTER TABLE kunden
    ADD (CONSTRAINT kunden_krankenkassen_fk
             FOREIGN KEY (krankenkasse_id)
                 REFERENCES krankenkassen (krankenkasse_id),
         CONSTRAINT kunden_trainer_fk
             FOREIGN KEY (trainer_id)
                 REFERENCES trainer (trainer_id),
         CONSTRAINT kunden_kundendenkarte_fk
             FOREIGN KEY (kundenkarte_id)
                 REFERENCES kundenkarten (kundenkarte_id)
        );

ALTER TABLE individualplaene
    ADD (CONSTRAINT inditrplan_trplan_fk
        FOREIGN KEY (trainingsplan_id)
            REFERENCES trainingsplaene (trainingsplan_id)
        );

-- TODO Trainer soll id von Mitarbeiter erben
ALTER TABLE trainer
    ADD (CONSTRAINT trainer_mitarbeiter_fk
        FOREIGN KEY (mitarbeiter_id)
            REFERENCES mitarbeiter (mitarbeiter_id)
        );

ALTER TABLE trainingseinheiten
    ADD (CONSTRAINT te_sg_fk
        FOREIGN KEY (sportgeraet_id)
            REFERENCES sportgeraete (sportgeraet_id)
        );

ALTER TABLE kundenvertraege
    ADD (CONSTRAINT kundenvertraege_kunden_fk
        FOREIGN KEY (kunde_id)
            REFERENCES kunden (kunde_id)
        );

ALTER TABLE durchfuehrungen
    ADD (CONSTRAINT df_te_fk
        FOREIGN KEY (trainingseinheit_id)
            REFERENCES trainingseinheiten (trainingseinheit_id)
        );

ALTER TABLE buchungsverlauf
    ADD (CONSTRAINT bv_kundenkarte_fk
        FOREIGN KEY (kundenkarte_id)
            REFERENCES kundenkarten (kundenkarte_id)
        );