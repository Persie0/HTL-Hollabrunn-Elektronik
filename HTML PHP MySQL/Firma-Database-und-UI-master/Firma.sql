DROP DATABASE IF EXISTS firma_db;
create database firma_db;
use firma_db;

DROP TABLE IF EXISTS Logo;
create table Logo(
ID int NOT NULL AUTO_INCREMENT,
Standort varchar(40) NOT NULL,
Zustand varchar(40),
Typ varchar(40) NOT NULL,
PRIMARY KEY (ID)
);
insert into Logo( Standort, Zustand, Typ) value ('Jirny', 'Beschädigt', 'B3');
insert into Logo( Standort, Zustand, Typ) value ('Wien', 'Neu', 'B1');
insert into Logo( Standort, Zustand, Typ) value ('Horn', 'Gut', 'A3');
insert into Logo( Standort, Zustand, Typ) value ('Wien', 'Beschädigt', 'C3');
insert into Logo( Standort, Zustand, Typ) value ('Hollabrunn', 'Gebraucht', 'B2');
insert into Logo( Standort, Zustand, Typ) value ('Retz', 'Neu', 'B3');
insert into Logo( Standort, Zustand, Typ) value ('Linz', 'Gut', 'B1');



DROP TABLE IF EXISTS Kunde;
create table Kunde(
ID int NOT NULL AUTO_INCREMENT,
Vorname varchar(40) NOT NULL,
Nachname varchar(40) NOT NULL,
Telefonnummer varchar(30),
Email varchar(40) NOT NULL,
Passwort varchar(50) NOT NULL,
PRIMARY KEY (ID)
);
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Rene', 'Barth', '4667763560908', 'abcd@cd.ab', 'rene2004');
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Lorenz', 'Barth', '4667763244327', 'lorenz@mail.de', 'lorenzist');
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Dennis', 'Soos', '+43438843834', 'dennis.s@gmail.ab', 'ds399');
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Lukas', 'Müller', '46324237324', 'luk.mue@cd.ab', '123456');
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('David', 'Zuser', '+454298234832', 'david.z@cd.at', '0000000');
insert into Kunde (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Sven', 'Huber', '+466435743534', 's.huber@cd.com', '123456789');



DROP TABLE IF EXISTS Arbeiter;
create table Arbeiter(
ID int NOT NULL AUTO_INCREMENT,
Vorname varchar(40) NOT NULL,
Nachname varchar(40) NOT NULL,
Telefonnummer varchar(30),
Email varchar(40) NOT NULL,
Passwort varchar(40) NOT NULL,
PRIMARY KEY (ID)
);
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Arbeiter noch nicht Zugewiesen', '', '', 'admin@mail.com', '1234');
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Lukas', 'Barth', '721458621', 'lukas@hey.com', 'lukasworker');
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Rene', 'Soos', '+420721188908', 'rene.soos@hey.com', 'starwars');
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Daniel', 'Raab', '2147483647', 'haloe332@hey.com', 'raab200');
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Eduard', 'Maas', '+4307832432', 'eduard@mail.com', 'edmaas1990');
insert into Arbeiter (Vorname, Nachname, Telefonnummer, Email, Passwort) value ('Daniel', 'Rob', '+43072183242', 'dan.rob@gmail.com', 'dani987');



DROP TABLE IF EXISTS Auftrag;
create table Auftrag(
ID int NOT NULL AUTO_INCREMENT,
Preis int NOT NULL,
Erstelldatum DATE,
Deadline DATE NOT NULL,
Art varchar(40), 
Erledigt VARCHAR(1) NOT NULL DEFAULT 'N',
LogoID int NOT NULL,
KundeID int NOT NULL,
ArbeiterID int NOT NULL,
primary key (ID),
FOREIGN KEY (LogoID) REFERENCES Logo(ID),
FOREIGN KEY (KundeID) REFERENCES Kunde(ID),
FOREIGN KEY (ArbeiterID) REFERENCES Arbeiter(ID)
);
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID, Erledigt) value ('100000', '2021-10-22','2022-08-01', 'Reparatur','1','2','3','Y');
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID) value ('3000', '2021-10-25','2022-08-02', 'Anbringen','2','2','2');
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID) value ('1200', '2021-10-29','2022-01-01', 'Abbauen','2','2','1');
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID) value ('5000', '2021-11-30','2022-03-07', 'Reparatur','2','2','1');
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID, Erledigt) value ('30000', '2021-12-22','2022-04-21', 'Anbringen','5','5','2','Y');
insert into Auftrag (Preis, Erstelldatum, Deadline, Art, LogoID, KundeID, ArbeiterID) value ('6900', '2021-11-03','2022-03-22', 'Abbauen','6','4','2');
