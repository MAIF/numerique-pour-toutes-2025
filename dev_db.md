
# Base de données
## Introduction
**Qu'est-ce qu'une base de données ?**

Une base de données est un système qui permet d'accéder facilement à un ensemble organisé de données, de les manipuler et de les mettre à jour. Comme montré ci-dessous dans le schéma, le client (un site web, une application, etc.) envoie une requête à une API (un serveur) qui va récupérer et/ou mettre à jour les données associées dans la base de données.

![Une conversation entre le client, l'API et la base de données](https://user.oc-static.com/upload/2021/10/19/1634632670253_web_API.png)

Voici un exemple simple de base de données basée sur de la notation de films. Un film est représenté entre autres par son titre. Il y a des internautes qui donnent des notes aux films. Il y a également des artistes présents dans le film, qui joue un rôle dans celui-ci ou qui le réalise. Enfin, le film peut être diffusé en plusieurs langues dans des pays identifiés par un code.
Comme nous pouvons le voir ici, une base de données est composée de tables (Artiste, Film, Internaute, Pays) et de colonnes (nom, prénom, titre, année, résumé, mot de passe, etc.).

![La base de données](https://lh4.googleusercontent.com/proxy/vKrC7D1Qk1SaCzjDEMmMCQ5VMv7mKk1ZpO6a73IKSA5DjOt1jImS0lFzBl-tVGw9Fi3M7IFDqfwisMyFFT89ZQ)

**Aide**

Pour des informations supplémentaires ou de l'aide pendant vos exercices, vous pouvez utiliser [SQL Tutorial](https://www.w3schools.com/sql/default.asp). 

## Exercices : accès à l'excercice sur [programiz](https://www.programiz.com/sql/online-compiler/)

**Instructions** 

Vous allez utiliser et compléter la base de données d'une équipe de développement.

**Objectifs**
1. Découvrir le stockage de données via SQL
2. Lire des données
3. Ajouter de nouvelles données
4. Introduction à de la syntaxe plus complexe

#### **Étape 1 : Initialiser les données**
1. Récupérez le fichier [init_sql_npt_2025.sql](init_sql_npt_2025.sql)
2. Copiez/collez son contenu entier dans "Input" sur [Programiz](https://www.programiz.com/sql/online-compiler/)
3. Cliquez sur "Run SQL"
4. Supprimez tout ce qui se trouve dans "Input"
5. Comprenez les "Available Tables" sur la droite en utilisant le schéma proposé ci-dessous

```mermaid
flowchart LR 
Tribu --regroupe--> Squad 
Squad --contient--> Personne
Personne --a une--> Fonction
```
---

#### **Étape 2 : Lire des données grâce à SQL**
1.	Récupérez les données de la table TRIBU
<details>
<summary>
Solution
</summary>
	
```sql  
SELECT * FROM TRIBU;
```

</details>
	
2. Récupérez UNIQUEMENT le nom des SQUAD
<details>
<summary>
Solution
</summary>
	
```sql  
SELECT nom FROM SQUAD;
```

</details>

3. Récupérez UNIQUEMENT le nom de la table FONCTION où l'idFonction vaut 5
<details>
<summary>
Solution
</summary>
	
```sql  
SELECT nom FROM FONCTION where idFonction = 5;
```

</details>

4. Récupérez toutes les informations de PERSONNE qui sont des développeurs
<details>
<summary>
Solution
</summary> 
	
```sql  
SELECT * FROM PERSONNE where fonction = 5;
```

 </details>
 
5. Récupérez les noms de PERSONNE triés par ordre alphabétique (A->Z), ensuite par ordre anti-alphabétique (Z->A)
<details>
<summary>
Solution
</summary> 
	
```sql  
SELECT nom FROM PERSONNE order by nom asc;
SELECT nom FROM PERSONNE order by nom desc;
```

</details>

6. Récupérez le nombre de FONCTION différente
<details>
<summary>
Solution
</summary> 
	
```sql  
SELECT DISTINCT COUNT(*) AS compteurFonction FROM FONCTION;
```

</details>

7. Récupérez le nombre de PERSONNE dans chaque SQUAD
<details>
<summary>
Solution
</summary> 
	
``` sql  
SELECT SQUAD, COUNT(*) as compteurPersonne FROM PERSONNE GROUP BY SQUAD;
```

</details>

---

#### **Étape 3 : Ajouter de nouvelles données**
1. Ajoutez une nouvelle TRIBU ayant comme nom "Sinistres"
<details>
<summary>
Solution
</summary> 
	
 ```sql  
INSERT INTO TRIBU (idTribu, nom, description) 
VALUES (2, "Sinistres", "La tribu sinistres gère les applications et les services en lien avec les sinistres.");
```

</details>

2. Ajoutez une nouvelle SQUAD à la TRIBU "Sinistres"
<details>
<summary>
Solution
</summary> 
	
 ```sql  
INSERT INTO SQUAD (idSquad, nom, description, tribu) 
VALUES (3, "Déclaration", "La squad déclaration gère toutes les application permettant aux gestionnaires de déclarer les sinistres.", 2);
```

</details>

3. Ajoutez vous en tant que nouvelle PERSONNE dans la SQUAD "Déclaration"
<details>
<summary>
Solution
</summary> 
	
```sql
INSERT INTO PERSONNE (idPersonne, nom, prenom, squad, fonction) 
VALUES (11, "Heintz", "Kelly", 3, 5);
```

</details>

#### **Étape 4 : Lire des informations complexes**
1. Récupérez le nom, prénom et le nom de SQUAD de chaque PERSONNE
<details>
<summary>
Solution
</summary> 
	
```sql
SELECT p.nom, p.prenom, s.nom
FROM PERSONNE p
JOIN SQUAD s
ON p.squad = s.idSquad;
```

</details>

2. Récupérez les mêmes informations que l'exercice précédent, uniquement pour votre PERSONNE en y rajoutant le nom de la TRIBU
<details>
<summary>
Solution
</summary> 
	
``` sql
SELECT p.nom as nomPersonne, p.prenom, s.nom as nomSquad, t.nom as nomTribu
FROM PERSONNE p
JOIN SQUAD s
ON p.squad = s.idSquad
JOIN TRIBU t
ON s.tribu = t.idTribu
WHERE p.nom = 'Heintz'
AND p.prenom = 'Kelly';
```

</details>

### **Résumé**
À la fin de l'atelier, chaque participante aura :
1. Lu et compris du SQL simple
2. Ajouté de nouvelles données en SQL
3. Découvert du SQL plus complexe
