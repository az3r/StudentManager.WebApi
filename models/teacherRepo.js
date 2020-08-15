const db = require('../db/db');

exports.listClass = (TeacherId, sem, year) => {
	const sql= `select distinct Schedule.ClassId, e.SumStudent from Schedule join (select EnrolledClass.ClassId, count(*) as SumStudent from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId group by EnrolledClass.ClassId) as e on Schedule.ClassId = e.ClassId  where TeacherId = '${TeacherId}'`
	return db.load(sql);
}
exports.schedule = (TeacherId, sem, year) => {
	const 	sql = `select Session.SessionId, CONVERT(VARCHAR(5),Session.BeginTime) as BeginTime, CONVERT(VARCHAR(5),Session.EndTime) as EndTime, DayOfWeek, Subject.SubjectName, ClassId, Room.RoomName, Semester, AcademicYear from Schedule join Subject on Schedule.SubjectId = Subject.SubjectId join Room on Schedule.RoomId = Room.RoomId join Session on Schedule.SessionId = Session.SessionId where Schedule.TeacherId = '${TeacherId}' and Semester = ${sem} and AcademicYear = ${year};`;
	return db.load(sql);
}
exports.single = (TeacherId) => {
	const sql=`select Teacher.TeacherId, SchoolRole.RoleName, Subject.SubjectName, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday from Teacher join PersonalInfo on Teacher.TeacherId = PersonalInfo.PersonalInfoId join SchoolRole on Teacher.RoleId = SchoolRole.RoleId join Subject on Teacher.SubjectId = Subject.SubjectId where Teacher.TeacherId=${TeacherId};`;
	return db.load(sql);
}
exports.singleScore = (score) => {
	const sql=`select * from Score where SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType} and ScoreValue = ${score.ScoreValue} and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and StudentId = '${score.StudentId}';`;
	return db.load(sql);
}
exports.addScore = (score) => {
	const sql = `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score.StudentId}', ${score.SubjectId}, ${score.ScoreType}, ${score.ScoreValue}, ${score.Semester}, ${score.AcademicYear});`;
    return db.load(sql);
}
exports.updateScore = (score) => {
	const sql = `update Score set SubjectId = ${score.SubjectId}, ScoreType = ${score.ScoreType}, ScoreValue = ${score.ScoreValue}, Semester = ${score.Semester}, AcademicYear = ${score.AcademicYear} where StudentId = '${score.StudentId}';`;
    return db.load(sql);
}