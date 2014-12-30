CREATE TABLE IF NOT EXISTS article(
   id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(255) UNIQUE,
   subject VARCHAR(255),
   rank INTEGER,
   url VARCHAR(255) UNIQUE,
   date VARCHAR(255),
   threadid INTEGER
);
