USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
explain
SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;
-- nested subquery to simple joins
-- ALTER TABLE `springboardopt`.`professor` 
-- CHANGE COLUMN `id` `id` INT NOT NULL ,
-- ADD PRIMARY KEY (`id`),
-- ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE;
-- ;
-- ALTER TABLE `springboardopt`.`teaching` 
-- CHANGE COLUMN `crsCode` `crsCode` VARCHAR(255) NOT NULL ,
-- CHANGE COLUMN `semester` `semester` VARCHAR(255) NOT NULL ,
-- ADD PRIMARY KEY (`crsCode`, `semester`);
-- ;
-- ALTER TABLE `springboardopt`.`teaching` 
-- ADD INDEX `prof_idx` (`profId` ASC) VISIBLE;
-- ;
-- ALTER TABLE `springboardopt`.`teaching` 
-- ADD CONSTRAINT `prof`
--   FOREIGN KEY (`profId`)
--   REFERENCES `springboardopt`.`professor` (`id`)
--   ON DELETE NO ACTION
--   ON UPDATE NO ACTION;
