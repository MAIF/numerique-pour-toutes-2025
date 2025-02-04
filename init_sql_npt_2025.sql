-- clear data

DROP TABLE customers;
DROP TABLE orders;
DROP TABLE shippings;

-- create
CREATE TABLE TRIBU (
  idTribu int NOT NULL,
  nom varchar(25) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (idTribu)
);

CREATE TABLE SQUAD(
  idSquad int NOT NULL,
  nom varchar(25) NOT NULL,
  description varchar(255) NOT NULL,
  tribu int NOT NULL,
  PRIMARY KEY (idSquad),
  FOREIGN KEY (tribu) REFERENCES TRIBU (idTribu)
);

CREATE TABLE PERSONNE(
  idPersonne int NOT NULL,
  nom varchar(25) NOT NULL,
  prenom varchar(25) NOT NULL,
  squad int NOT NULL,
  fonction int NOT NULL,
  PRIMARY KEY (idPersonne),
  FOREIGN KEY (squad) REFERENCES SQUAD (idSquad),
  FOREIGN KEY (fonction) REFERENCES FONCTION (idFonction)
);

CREATE TABLE FONCTION(
  idFonction int NOT NULL,
  acronyme varchar(5),
  nom varchar(50),
  description varchar(255),
  PRIMARY KEY (idFonction)
);

-- insert
INSERT INTO TRIBU VALUES (1, "Tribu contrat", "La tribu contrat gère les applications et les services en lien avec les devis et les contrats d'assurance.");

INSERT INTO SQUAD VALUES (1, "Souscripteurs", "La squad souscripteurs gère les applications et les services dédiés à la gestion du souscripteur.", 1);
INSERT INTO SQUAD VALUES (2, "Comptes", "La squad comptes gère toutes les applications et les services dédiés à la gestion des comptes du souscripteur.", 1);

INSERT INTO FONCTION VALUES (1, "RT", "Responsable de tribu", "Le Responsable de Tribu est en charge de l’organisation et du bon fonctionnement de sa Tribu et de ses livraisons. Il s'assure que les Squads ont les moyens de répondre à la vision attendue.");
INSERT INTO FONCTION VALUES (2, "AM", "Agile Master", "L'Agile Master organise et facilite le fonctionnement d'une ou plusieurs Squads dans une optique de livraison et d'efficience dans le respect des pratiques agiles.");
INSERT INTO FONCTION VALUES (3, "BA", "Business Analyst", "Le Business Analyst analyse les besoins du client et étudie  les meilleures solutions permettant de les mettre en oeuvre.");
INSERT INTO FONCTION VALUES (4, null, "Testeur", "Le testeur participe au processus de conception d’un logiciel en contribuant à l’élaboration du plan de test et en évaluant la qualité de ses composants.");
INSERT INTO FONCTION VALUES (5, "DEV", "Développeur", "Le développeur réalise des applications et des sites webs. Il les maintient également en condition opérationnelles, c'est-à-dire qu'il peut améliorer leur performance, corriger des bugs et rajouter de nouvelles évolutions en attente avec les besoins du client.");

INSERT INTO PERSONNE VALUES (1, "Dunstan", "Tyra", 1 ,2);
INSERT INTO PERSONNE VALUES (2, "Abigayle", "Laila", 1, 3);
INSERT INTO PERSONNE VALUES (3, "Gordy", "Cyril", 1, 3);
INSERT INTO PERSONNE VALUES (4, "Denver", "Melody", 1, 4);
INSERT INTO PERSONNE VALUES (5, "Tracee", "Buffy", 1, 5);

INSERT INTO PERSONNE VALUES (6, "Tevin", "Bobby", 2, 2);
INSERT INTO PERSONNE VALUES (7, "Dunstan", "Beatrice", 2, 3);
INSERT INTO PERSONNE VALUES (8, "Abigayle", "Edwyn", 2, 4);
INSERT INTO PERSONNE VALUES (9, "Gordy", "Melody", 2, 5);
INSERT INTO PERSONNE VALUES (10, "Dunstan", "Buffy", 2, 5);