CREATE TABLE Users
(
    id       BIGSERIAL PRIMARY KEY,
    email    varchar(128) NOT NULL,
    password varchar(128) NOT NULL
);

CREATE table Roles
(
    id   BIGSERIAL PRIMARY KEY,
    name varchar(32) NOT NULL
);

create table user_role
(
    user_id bigserial references Users (id),
    role_id bigserial references Roles (id)
);

CREATE TABLE Course
(
    id      BIGSERIAL PRIMARY KEY,
    num     int NOT NULL,
    user_id BIGINT REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Semester
(
    id        BIGSERIAL PRIMARY KEY,
    num       int NOT NULL,
    course_id BIGINT REFERENCES Course(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Discipline
(
    id          BIGSERIAL PRIMARY KEY,
    name        varchar(128) NOT NULL,
    semester_id BIGINT REFERENCES Semester(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Folder
(
    id            BIGSERIAL PRIMARY KEY,
    name          varchar(128) NOT NULL,
    discipline_id BIGINT REFERENCES Discipline(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE File
(
    id          BIGSERIAL PRIMARY KEY,
    name        varchar(128) NOT NULL,
    path        varchar(128) NOT NULL,
    upload_time timestamp NOT NULL,
    folder_id   BIGINT REFERENCES Folder(id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE UserSetting
(
    id BIGSERIAL PRIMARY KEY,
    user_id  BIGINT REFERENCES Users(id) ON  DELETE CASCADE  ON UPDATE CASCADE,
    lesson_duration int NOT NULL,
    break_time int NOT NULL
);



CREATE TABLE Schedule
(
    id          BIGSERIAL PRIMARY KEY,
    semester_id BIGINT REFERENCES semester(id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE ScheduleItem
(
    id          BIGSERIAL PRIMARY KEY,
    schedule_id BIGINT REFERENCES  Schedule(id) ON DELETE CASCADE  ON UPDATE  CASCADE,
    lesson_num int NOT NULL,
    discipline_id BIGINT REFERENCES  Discipline(id) ON DELETE CASCADE  ON UPDATE  CASCADE,
    week_type varchar(32) NOT NULL,
    lesson_type varchar(32) NOT NULL,
    weekday varchar(32) NOT NULL
);
SELECT * FROM Course;
SELECT * FROM Discipline;
SELECT * FROM Semester;
SELECT * FROM Schedule;
INSERT INTO Schedule (semester_id)
VALUES(1);
INSERT INTO ScheduleItem (schedule_id, lesson_num, discipline_id, week_type, lesson_type, weekday)
VALUES (1,1,1,'NON_PAIR','LAB','TUESDAY');

SELECT * FROM Schedule as s JOIN ScheduleItem SI on s.id = SI.schedule_id
                            JOIN Semester as sem  on semester_id =  sem.id
                            JOIN Course as c on sem.course_id = c.id
                            JOIN Users U on c.user_id = U.id;

INSERT
INTO Users (email, password)
values ('abc@gmail.com', 'abc');

INSERT INTO Course (num, user_id)
values (1, 1);

