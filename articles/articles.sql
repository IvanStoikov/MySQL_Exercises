DROP DATABASE IF EXISTS articles;
CREATE DATABASE articles;
USE articles;

CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(100) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
pass VARCHAR(100) NOT NULL,
type ENUM('admin','author','reader') NOT NULL
);


CREATE TABLE images(
id INT AUTO_INCREMENT PRIMARY KEY,
image VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
name ENUM('national','international','criminal','science','culture','sport') NOT NULL
);

CREATE TABLE comments(
id INT AUTO_INCREMENT PRIMARY KEY,
content VARCHAR(100) NOT NULL,
commentDate DATETIME NOT NULL,
users_id INT NOT NULL,
FOREIGN KEY (users_id) REFERENCES users(id)
);


CREATE TABLE article(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
story VARCHAR(100) NOT NULL,
publishingDate DATETIME NOT NULL,
viewCounter INT NOT NULL,
users_id INT NOT NULL,
categories_id INT NOT NULL,
FOREIGN KEY (users_id) REFERENCES users(id),
FOREIGN KEY (categories_id) REFERENCES categories(id)
);


CREATE TABLE articleImages(
id INT AUTO_INCREMENT PRIMARY KEY,
images_id INT NOT NULL,
articles_id INT NOT NULL,
FOREIGN KEY (images_id) REFERENCES images(id),
FOREIGN KEY (articles_id) REFERENCES article(id)
);


CREATE TABLE articleComments(
id INT AUTO_INCREMENT PRIMARY KEY,
comments_id INT NOT NULL,
articles_id INT NOT NULL,
FOREIGN KEY (comments_id) REFERENCES comments(id),
FOREIGN KEY (articles_id) REFERENCES article(id)
);



INSERT INTO users(username,email,pass,type)
VALUES ('IvanStoikov','vankata@abv.bg','123456','admin'),
('AniSpasova','ani@abv.bg','123456789','reader'),
('EmiSpasova','emi@gmail.com','12345','reader'),
('Rumi','rumi@abv.bg','54321','author'),
('Niki','niki@gmail.com','24681012','author'),
('Desi','desi@gmail.com','19862735','reader'),
('Aleks','aleks@gmail.com','83674363','reader');

INSERT INTO categories(name)
VALUES ('national'),('international'),('criminal'),('science'),('culture'),('sport');

INSERT INTO images(image)
VALUES('https://www.worksheetsplanet.com/wp-content/uploads/2023/03/What-is-an-article.jpg'),('https://www.worksheetsplanet.com/wp-content/uploads/2023/03/What-is-an-a'),('https://www.worksheetsplanet.com/wp-content/uploads/2023/03/W'),('https://www.worksheetsplanet.com/wp-content/uploads/2002/WBVCUIB'),('https://www.worksheetsplanet.com/wp-content/uploads/2023/03/What-is-WEFWFV 2QDNIVRV');

INSERT INTO comments(content,commentDate,users_id)
VALUES('That is amazing','2024-06-06 11:00:00',1),('Incredible','2024-09-19 12:00:00',2),('Can you explain?','2024-06-11 13:00:00',3),('Whose is this horse','2024-06-11 13:00:10',4),('YES!','2024-06-11 13:00:00',5);


INSERT INTO article(title,story,publishingDate,viewCounter,users_id,categories_id)
VALUES('Bulgarian children','Bulgarian children are very smart but also very lasy....','2024-06-06 11:00:00',100,1,1),
('News 24/7','Weather is rainy','2024-09-19 12:00:00',1345,2,2),
('Horse competition','On first place is Maestro number 24','2024-06-11 13:00:00',900,5,6),
('Horse competition','On first place is Maestro number 24','2024-06-11 13:00:10',900,4,6),
('Computer sciences','Linux','2024-06-11 13:00:00',1230,3,4);

INSERT INTO articleImages(images_id,articles_id)
VALUES(1,1),(3,2),(2,3),(4,4),(5,5);

INSERT INTO articleComments(comments_id,articles_id)
VALUES(1,1),(2,2),(5,3),(4,4),(3,5);






