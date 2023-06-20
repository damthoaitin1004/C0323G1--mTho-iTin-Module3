CREATE DATABASE student_academy_management;
USE student_academy_management;
CREATE TABLE class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_name DATETIME    NOT NULL,
    status    BIT
);
CREATE TABLE student
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id)
);
CREATE TABLE subject
(
    subject_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(30) NOT NULL,
    creadit  TINYINT     NOT NULL DEFAULT 1 CHECK ( creadit >= 1 ),
    status  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    examTimes TINYINT DEFAULT 1,
    UNIQUE (subject_id, student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);