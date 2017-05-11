use university;

CREATE TABLE `university`.`department` (
  `dept_name` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NOT NULL,
  `budget` DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`dept_name`));


CREATE TABLE `university`.`student` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` CHAR(1) NULL,
  `age` INT UNSIGNED NULL,
  `emotion_state` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_1_idx` (`dept_name` ASC),
  CONSTRAINT `fk_student_1`
    FOREIGN KEY (`dept_name`)
    REFERENCES `university`.`department` (`dept_name`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);
    
CREATE TABLE `university`.`exam` (
  `student_ID` INT NOT NULL,
  `exam_name` VARCHAR(45) NOT NULL,
  `grade` INT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`student_ID`, `exam_name`),
  CONSTRAINT `fk_exam_1`
    FOREIGN KEY (`student_ID`)
    REFERENCES `university`.`student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);