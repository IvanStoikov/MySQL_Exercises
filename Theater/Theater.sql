DROP DATABASE IF EXISTS theater;
CREATE DATABASE theater;
USE theater;

CREATE TABLE theater(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
UNIQUE(name,city)
);

CREATE TABLE screen(
id INT NOT NULL,
type ENUM('normal','deluxe','VIP') NOT NULL,
theater_id INT NOT NULL,
FOREIGN KEY (theater_id) REFERENCES theater(id),
PRIMARY KEY(id,theater_id)
);

CREATE TABLE movie(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
year YEAR NOT NULL,
country VARCHAR(100) NOT NULL
);



CREATE TABLE projection(
time DATETIME NOT NULL,
countVisitor INT UNSIGNED NOT NULL,
movie_id INT NOT NULL,
screen_id INT NOT NULL,
theater_id INT NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(id),
FOREIGN KEY (screen_id,theater_id) REFERENCES screen(id,theater_id),
PRIMARY KEY(time,screen_id,theater_id)
);




