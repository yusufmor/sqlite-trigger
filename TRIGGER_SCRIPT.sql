CREATE TRIGGER TR_STUDENT_ADD_SCHOOL_NUMBER AFTER INSERT ON STUDENT
FOR EACH ROW 
BEGIN
    UPDATE school_number_trigger SET school_number = (SELECT school_number FROM school_number_trigger) + 1 WHERE ID = 1;
    UPDATE STUDENT SET SCHOOL_NUMBER = (SELECT school_number FROM school_number_trigger) WHERE ID = new.ID;
END;

CREATE TRIGGER TR_TEACHER_ADD_SCHOOL_NUMBER AFTER INSERT ON TEACHER
FOR EACH ROW 
BEGIN
    UPDATE school_number_trigger SET school_number = (SELECT school_number FROM school_number_trigger) + 1 WHERE ID = 1;
    UPDATE TEACHER SET SCHOOL_NUMBER = (SELECT school_number FROM school_number_trigger) WHERE ID = new.ID;
END;