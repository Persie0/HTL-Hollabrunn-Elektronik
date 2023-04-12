DROP DATABASE IF EXISTS fsst;
create database fsst;
use fsst;

DROP TABLE IF EXISTS Skicardevent;
CREATE TABLE IF NOT EXISTS Skicardevent ( id INT NOT NULL auto_increment,  Skicardnr VARCHAR(50) NOT NULL, Timest TIMESTAMP  NOT NULL, primary key (id));

insert into Skicardevent( Skicardnr, Timest) value ('da2a5f3e-9603-42c9-ab45-4e70d9906c8e', '2020-01-01 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('c8008b9b-cb58-42d3-86e3-7ec5c6c8a1ca', '2020-02-02 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('fffa205a-5e02-48de-8752-19c98e4c36b7', '2020-03-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('21742fbb-ba4d-4db8-8d7c-785645f70208', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('9402ab50-e3aa-42e5-8876-79a1b25ed9c9', '2020-01-01 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('0aea78f1-e94a-4126-8785-e1aaa67c2ed9', '2020-02-02 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('b2e71c9c-81e7-445c-9727-44039f917df0', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('368b6fdc-c925-4351-b3b2-2081487b880f', '2020-01-04 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('a0bc61fb-79e3-4724-b243-e2155e33b7c3', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('412ae994-f387-4182-a8d9-94c71170674e', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('9af37b14-5a6f-4f39-81c3-67640f6e303a', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('183453bd-ffdc-4530-ac3f-b36b5efc3a81', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('dbf0b254-8302-4e0b-87d8-cf7fe075d73d', '2020-01-13 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('124a2cb9-253c-4a81-a982-da59a65f778f', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('c79e4e17-f244-4f0e-8d3e-92d066739615', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('2f624eef-1317-4b5b-a2be-bf50d4dd89fc', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('22a19295-c698-4504-b840-6b8146be75f8', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('9faae5ba-e983-4240-bb83-206c7e208908', '2020-01-03 15:10:10');

insert into Skicardevent( Skicardnr, Timest) value ('2e64c304-c17c-4f1e-b7a6-cf6798d23374', '2020-01-03 15:10:10');


DROP TABLE IF EXISTS Wettermessung;
create table Wettermessung(
ID int NOT NULL AUTO_INCREMENT,
Ort varchar(40) NOT NULL,
Timest TIMESTAMP  NOT NULL,
Temperatur DOUBLE NOT NULL,
PRIMARY KEY (ID)
);

insert into Wettermessung (Ort, Timest, Temperatur) value ('Hollabrunn', '2020-01-01 15:10:10', 23.0);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Hollabrunn', '2020-02-02 15:10:10', 22);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Hollabrunn', '2020-03-03 15:10:10', 37.2);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Wien', '2020-01-03 15:10:10', 1);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Wien', '2020-01-01 15:10:10', 12.3);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Wien', '2020-02-02 15:10:10', 22.3);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Horn', '2020-01-03 15:10:10', -3);
insert into Wettermessung (Ort, Timest, Temperatur) value ('Horn', '2020-01-04 15:10:10', -2.8);


