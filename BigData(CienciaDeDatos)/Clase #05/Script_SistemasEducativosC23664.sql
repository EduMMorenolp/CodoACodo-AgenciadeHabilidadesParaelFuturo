
CREATE SCHEMA `sist_educ23664` ;

USE sist_educ23664;

CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_escuela` int(11) DEFAULT NULL,
  `legajo` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `nota` decimal(10,0) DEFAULT NULL,
  `grado` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_escuela`) REFERENCES `escuelas`(`id`));

INSERT INTO `escuelas` VALUES (1,'Normal 1','Quilmes','Buenos Aires',250),(2,'Gral. San Martín','San Salvador','Jujuy',100),(3,'Belgrano','Belgrano','Córdoba',150),(4,'EET Nro 2','Avellaneda','Buenos Aires',500),(5,'Esc. N° 2 Tomás Santa Coloma','Capital Federal','Buenos Aires',250),(6,'Carlos Guido y Spano','Capital Federal','Buenos Aires',1250),(7,'Paula Albarracín de Sarmiento','Tres Arroyos','Buenos Aires',1100),(8,'Escuela Nro.392','Sijan','Catamarca',250),(9,'General Las Heras','Las Heras','Córdoba',1500),(10,'E.E.P. Nro.852','El Sauzalito','Chaco',452);

insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (8, 216219, 'Fanchon Kettel', 1, 6, 'fkettel0@hp.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 182251, 'Valerie Mound', 5, 6, 'vmound1@addthis.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (8, 164662, 'Pren Lenglet', 10, 2, 'plenglet2@forbes.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (3, 250990, 'Mariann McLeoid', 6, 7, 'mmcleoid3@typepad.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 237472, 'Lily Copas', 4, 1, 'lcopas4@nsw.gov.au');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (6, 232002, 'Damien Mulvy', 6, 4, 'dmulvy5@sakura.ne.jp');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (9, 168409, 'Gard Hudson', 5, 1, 'ghudson6@chron.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (7, 184096, 'Chrissie Hebden', 8, 5, 'notnull@noni.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 208120, 'Almira Faro', 1, 1, 'notnull@noni.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 193366, 'Cori Cantero', 4, 3, 'ccantero9@utexas.edu');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (NULL, 197639, 'Storm Gratten', 7, 4, 'sgrattena@cam.ac.uk');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (3, 227600, 'Emmalynne Doumenc', 10, 5, 'edoumencb@ifeng.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 228069, 'Alair Stalman', 2, 3, 'astalmanc@gnu.org');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 161546, 'Lorry Carreyette', 1, 7, '');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 199921, 'Marcellina Elt', 2, 5, 'melte@jalbum.net');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (9, 245012, 'Tiena Birks', 2, 5, 'tbirksf@jimdo.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (4, 167262, 'Brooke Dey', 4, 4, 'bdeyg@cbsnews.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 167034, 'Rogerio Hearthfield', 3, 5, 'rhearthfieldh@wix.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 185793, 'Mano Cassie', 9, 4, 'mcassiei@spiegel.de');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 250646, 'Cynthy Lambswood', 2, 4, 'clambswoodj@tripod.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (4, 163598, 'Yulma Quenby', 8, 1, 'yquenbyk@booking.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 191462, 'Merralee Richel', 4, 6, 'mrichell@apache.org');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (3, 234765, 'Cassius Arnoll', 10, 4, 'carnollm@boston.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (4, 169490, 'Dell Schenkel', 1, 5, 'notnull@noni.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 188456, 'Brannon Olivier', 9, 4, 'boliviero@technorati.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (NULL, 216785, 'Philly Daughtery', null, 6, 'pdaughteryp@macromedia.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 201812, 'Ebba Martill', 5, 4, 'emartillq@mozilla.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 247902, 'Gray Brouard', 6, 2, 'gbrouardr@gov.uk');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 192151, 'Mano Perott', 8, 2, 'mperotts@ft.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 182206, 'Anet Gierek', 5, 6, 'agierekt@xinhuanet.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (7, 188372, 'Georgine Stubbington', 8, 2, 'gstubbingtonu@twitpic.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 248802, 'Patten Poxton', null, 6, 'ppoxtonv@ox.ac.uk');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (8, 178393, 'Glenna Pattle', 2, 6, 'gpattlew@fema.gov');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 218729, 'Sophi Hampe', 8, 4, 'shampex@yelp.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (9, 176926, 'Layney Halloway', 5, 6, 'lhallowayy@ameblo.jp');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (6, 242136, 'Nanny Skelhorn', 1, 6, '');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 168345, 'Carin Giacoppo', 6, 5, 'cgiacoppo10@shareasale.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (6, 179039, 'Hew Brough', 1, 6, 'hbrough11@harvard.edu');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (2, 231365, 'Keenan Prettejohns', 1, 6, 'kprettejohns12@last.fm');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (7, 193949, 'Minna Klauber', 3, 3, 'mklauber13@bbb.org');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (3, 196614, 'Porter Mewhirter', 8, 6, 'pmewhirter14@phoca.cz');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (5, 253467, 'Dominick Treadaway', 3, 7, null);
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (4, 208727, 'Nicoline Terram', 1, 2, 'nterram16@go.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 188630, 'Stevie Lewington', 1, 2, 'slewington17@newyorker.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (10, 243287, 'Sayre Dulinty', 9, 4, 'sdulinty18@goo.gl');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (NULL, 251293, 'Gorden Withrington', 8, 6, 'gwithrington19@zimbio.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (3, 250093, 'Natala Paeckmeyer', 4, 7, 'npaeckmeyer1a@behance.net');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 196483, 'Lotte Summerbell', 5, 3, 'lsummerbell1b@walmart.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (1, 171121, 'Carmelle McKerlie', 1, 6, 'cmckerlie1c@engadget.com');
insert into alumnos (id_escuela, legajo, nombre, nota, grado, email) values (7, 172940, 'Ivor Ewells', 9, 1, '');
