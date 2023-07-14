/*
add any comments
*/


DROP DATABASE IF EXISTS sailors_club;
CREATE DATABASE sailors_club;
USE sailors_club;

DROP TABLE IF EXISTS reservation;

DROP TABLE IF EXISTS sailor;

DROP TABLE IF EXISTS boat;


CREATE TABLE sailor 
    (id      INT,
     name    VARCHAR(20) NOT NULL,
     rating  INT NOT NULL,
     age     INT NOT NULL,
     PRIMARY KEY (id));


CREATE TABLE boat
    (id      INT,
     name    VARCHAR(20) NOT NULL,
     colour  VARCHAR(10) NOT NULL,
     PRIMARY KEY (id));


CREATE TABLE reservation
    (sid     INT,
     bid     INT,
     day     DATE,
     PRIMARY KEY (sid, bid, day),
     FOREIGN KEY (sid) 
         REFERENCES sailor(id),
     FOREIGN KEY (bid) 
         REFERENCES boat(id));


INSERT INTO sailor VALUES (22 , 'Dustin' ,  7 , 45.0 );
INSERT INTO sailor VALUES (31 , 'Lubber' ,  8 , 65.5 );
INSERT INTO sailor VALUES (58 , 'Rusty'  , 10 , 35.0 );
INSERT INTO sailor VALUES (59 , 'Smith'  ,  9 , 41.0 );


INSERT INTO boat VALUES (101 , 'Interlake' , 'blue'  );
INSERT INTO boat VALUES (102 , 'Interlake' , 'red'   );
INSERT INTO boat VALUES (103 , 'Clipper'   , 'green' );
INSERT INTO boat VALUES (104 , 'Marine'    , 'red'   );
INSERT INTO boat VALUES (108, 'Sub Marine' , 'orange' );




INSERT INTO `reservation` (`sid`, `bid`, `day`) VALUES
(22, 101, '2006-10-10'),
(22, 101, '2006-10-11'),
(22, 101, '2006-10-13'),
(31, 101, '2008-01-05'),
(31, 102, '2007-02-15'),
(31, 103, '2007-02-05'),
(31, 104, '2007-02-04'),
(58, 103, '2006-12-11'),
(58, 103, '2007-02-06'),
(59, 102, '2008-01-05'),
(59, 102, '2008-01-29'),
(59, 104, '2007-02-28');

 




