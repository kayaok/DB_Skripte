INSERT INTO TRAININGSEINHEITEN VALUES ('TE_00', 'Biking', 20, 'Indoor Biking', null, 'TE_01', 'SG_017');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_01', 'Brustpresse', 15, 'Training an Maschine mit x Gewicht', 'TE_00', 'TE_02', 'SG_004');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_02', 'Schulterpresse', 15, 'Training an Maschine mit x Gewicht', 'TE_01', 'TE_03', 'SG_011');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_03', 'Beinbeuger', 15, 'Training an Maschine mit x Gewicht', 'TE_02', 'TE_04', 'SG_035');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_04', 'Beinstrecker', 20, 'Training an Maschine mit x Gewicht', 'TE_03', 'TE_05', 'SG_037');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_05', 'Rudern', 20, 'Training an Rudermaschine mit x Gewicht', 'TE_04', 'TE_06', 'SG_040');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_06', 'Abduktionsmaschine', 15, 'Training an Maschine mit x Gewicht', 'TE_05', 'TE_07', 'SG_041');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_07', 'Adduktionsmaschine', 15, 'Training an Maschine mit x Gewicht', 'TE_06', null, 'SG_042');

INSERT INTO TRAININGSEINHEITEN VALUES ('TE_08', 'Crosstrainer', 30, 'Crosstrainer Workout', null, 'TE_09', 'SG_006');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_09', 'Rueckenstrecker', 15, 'Training an der Maschine mit x Gewicht', 'TE_08', 'TE_10', 'SG_023');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_10', 'Bauchpresse', 15, 'Training an der Maschine mit x Gewicht', 'TE_09', 'TE_11', 'SG_014');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_11', 'Beinpresse', 15, 'Training an der Maschine mit x Gewicht', 'TE_10', 'TE_12', 'SG_005');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_12', 'Schulterpresse', 15, 'Training an der Maschine mit x Gewicht', 'TE_11', 'TE_13', 'SG_011');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_13', 'Butterfly', 15, 'Training an der Maschine mit x Gewicht', 'TE_12', 'TE_14', 'SG_034');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_14', 'Bauchtraining', 15, 'Training mit der Fitnessmatte', 'TE_13', 'TE_15', 'SG_031');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_15', 'Laufband', 30, 'Laufband laufen', 'TE_14', null, 'SG_025');

INSERT INTO TRAININGSEINHEITEN VALUES ('TE_16', 'Laufband', 45, 'Laufband laufen', null, 'TE_16', 'SG_025');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_17', 'Bankdruecken', 15, 'An der Hantelbank mit x Gewicht', 'TE_16', 'TE_18', 'SG_009');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_18', 'Trizeps-Curls', 10, 'Kabelturm mit x Gewicht', 'TE_17', 'TE_19', 'SG_015');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_19', 'Bizeps-Curls', 12, 'Hanteltraining mit x Gewicht', 'TE_18', 'TE_20', 'SG_012');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_20', 'Schulterdruecken', 15, 'Training an Schraegbank mit x Gewicht', 'TE_19', 'TE_29', 'SG_038');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_29', 'Rudern', 20, 'Training an Rudermaschine mit x Gewicht', 'TE_20', 'TE_30', 'SG_040');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_30', 'Sit-Ups', 12, 'Training an Maschine mit x Gewicht', 'TE_29', 'TE_31', 'SG_028');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_31', 'Biking', 30, 'Indoor Biking', 'TE_30', null, 'SG_017');

INSERT INTO TRAININGSEINHEITEN VALUES ('TE_21', 'Bankdruecken', 15, 'An der Hantelbank mit x Gewicht', null, 'TE_21', 'SG_009');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_22', 'Butterfly',15, 'Training an Maschine mit x Gewicht', 'TE_21', 'TE_23', 'SG_034');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_23', 'Schulterdruecken', 15, 'Training an Schraegbank mit x Gewicht', 'TE_22', 'TE_24', 'SG_038');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_24', 'Bizeps-Curls', 15, 'Hantelstange mit x Gewicht von Unten', 'TE_23', 'TE_25', 'SG_012');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_25', 'Trizeps-Curls',15, 'Kabelturm mit x Gewicht von Oben', 'TE_24', 'TE_26', 'SG_015');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_26', 'Beinpresse',15, 'Beinpresse mit x Gewicht', 'TE_25', 'TE_27', 'SG_005');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_27', 'Rueckentraining',15, 'Latismuszug mit x Gewicht', 'TE_26', 'TE_28', 'SG_036');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_28', 'Bauchpresse',15, 'Bauchpresse mit x Gewicht', 'TE_27', null, 'SG_014');

INSERT INTO TRAININGSEINHEITEN VALUES ('TE_32', 'Stepper',20, 'Stepper', null, 'TE_33', 'SG_001');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_33', 'Rudern',15, 'Rudermaschine', 'TE_32', 'TE_34', 'SG_040');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_34', 'Sit-Ups',15, 'Gymnastikball', 'TE_33', 'TE_35', 'SG_028');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_35', 'Biking',20, 'Indoor Biking', 'TE_34', 'TE_36', 'SG_017');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_36', 'Rueckentraining',15, 'Latismuszug', 'TE_35', 'TE_37', 'SG_036');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_37', 'Abduktionsmaschine', 15, 'Training an Maschine mit x Gewicht', 'TE_36', 'TE_38', 'SG_041');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_38', 'Adduktionsmaschine', 15, 'Training an Maschine mit x Gewicht', 'TE_37', 'TE_39', 'SG_042');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_39', 'Laufband', 15, 'Laufband laufen', 'TE_38', null, 'SG_025');

INSERT INTO TRAININGSEINHEITEN VALUES ('TE_40', 'Stepper', 60, 'Aerobic Stepper', null, null, 'SG_001');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_41', 'Crosstrainer', 60, 'Crosstrainer', null, null, 'SG_006');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_42', 'Fitnessmatte', 60, 'Fitnessmatte', null, null, 'SG_031');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_43', 'Faszienlockerung', 45, 'Faszienrolle', null, null, 'SG_020');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_44', 'Biking', 90, 'Indoor Biking', null, null, 'SG_017');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_45', 'Gymnastik', 20, 'Gymnastikball', null, null, 'SG_028');
INSERT INTO TRAININGSEINHEITEN VALUES ('TE_46', 'Hantelstange', 20, 'Freihanteln', null, null, 'SG_012');
