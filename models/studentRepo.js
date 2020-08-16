const db = require('../db/db');

exports.loadAllClass = () => {
	const sql=`select Class.ClassId, Class.ClassName, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName, e.SumStudent, e.AcademicYear from class left join homeroom on Class.ClassId = HomeRoom.ClassId
				left join PersonalInfo on PersonalInfo.PersonalInfoId = HomeRoom.TeacherId left join
				(select ClassId, AcademicYear, count(*) as SumStudent from EnrolledClass group by ClassId, AcademicYear) as e on e.ClassId = Class.ClassId`;
	return db.load(sql);
}
exports.loadAllStudent = (year) => {
	let sql = `select Student.StudentId, IsGraduated, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday, EnrolledClass.ClassId from Student join PersonalInfo on Student.StudentId = PersonalInfo.PersonalInfoId join EnrolledClass on Student.StudentId = EnrolledClass.StudentId`;
	if (year != null)
		sql = sql + ` where EnrolledClass.AcademicYear = ${year}`;
	return db.load(sql);
}
exports.singleStudent = (StudentId) => {
	const sql=`select Student.StudentId, IsGraduated, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday, EnrolledClass.ClassId from Student join PersonalInfo on Student.StudentId = PersonalInfo.PersonalInfoId join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId=${StudentId};`;
	return db.load(sql);
}
exports.add = student => {
	let sql = `insert into PersonalInfo(PersonalInfoId, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, Birthday, PersonTypeId) values('${student.StudentId}', '${student.Address}', '${student.LastName}', '${student.MiddleName}', '${student.FirstName}', '${student.Email}','${student.PhoneNumber}', ${student.IsMale},'${student.Birthday}', 1);
 				insert into Student(StudentId, IsGraduated) values('${student.StudentId}', 1);
 				insert into EnrolledClass(StudentId, ClassId, AcademicYear) values('${student.StudentId}', '${student.ClassId}', ${student.AcademicYear});
 				insert into Account(PersonalInfoId, Password) values('${student.StudentId}', '${student.Password}');`;
    return db.load(sql);
}
exports.update = student => {
	let sql = ` update Student set IsGraduated = ${student.IsGraduated} where StudentId = '${student.StudentId}';
				update PersonalInfo set Address = '${student.Address}', LastName = '${student.LastName}', MiddleName = '${student.MiddleName}', FirstName = '${student.FirstName}', Email = '${student.Email}', PhoneNumber = '${student.PhoneNumber}', IsMale = ${student.IsMale}, Birthday = '${student.Birthday}' where PersonalInfoId = '${student.StudentId}';
 				update EnrolledClass set ClassId = '${student.ClassId}' where StudentId = '${student.StudentId}'`;
    return db.load(sql);
}
exports.max = ()=>{
	const sql = `SELECT MAX(StudentId) as MAX FROM Student`;
	return db.load(sql);
}
exports.loadStudentInClass = (ClassId, year) => {
	const sql=`select EnrolledClass.ClassId, EnrolledClass.AcademicYear, Student.StudentId, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName, PersonalInfo.IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId join PersonalInfo on Student.StudentId = PersonalInfo.PersonalInfoId where EnrolledClass.ClassId = '${ClassId}' and EnrolledClass.AcademicYear = ${year};`
	return db.load(sql);
}
exports.singleTimeTable = (StudentId, Semester, AcademicYear) => {
	let sql = null
	if(Semester == null && AcademicYear == null)
		sql = `select Session.SessionId, CONVERT(VARCHAR(5),Session.BeginTime) as BeginTime, CONVERT(VARCHAR(5),Session.EndTime) as EndTime, Subject.SubjectName, ClassId, Room.RoomName, Semester, AcademicYear, DayOfWeek from Schedule join Subject on Schedule.SubjectId = Subject.SubjectId join Room on Schedule.RoomId = Room.RoomId join Session on Schedule.SessionId = Session.SessionId where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = Schedule.ClassId;`;
	if(Semester == null && AcademicYear != null)
		sql = `select Session.SessionId, CONVERT(VARCHAR(5),Session.BeginTime) as BeginTime, CONVERT(VARCHAR(5),Session.EndTime) as EndTime, Subject.SubjectName, ClassId, Room.RoomName, Semester, DayOfWeek from Schedule join Subject on Schedule.SubjectId = Subject.SubjectId join Room on Schedule.RoomId = Room.RoomId join Session on Schedule.SessionId = Session.SessionId where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId} and AcademicYear = ${AcademicYear}) = Schedule.ClassId;`;
	if(Semester != null && AcademicYear != null)
		sql = `select Session.SessionId, CONVERT(VARCHAR(5),Session.BeginTime) as BeginTime, CONVERT(VARCHAR(5),Session.EndTime) as EndTime, Subject.SubjectName, ClassId, Room.RoomName, DayOfWeek from Schedule join Subject on Schedule.SubjectId = Subject.SubjectId join Room on Schedule.RoomId = Room.RoomId join Session on Schedule.SessionId = Session.SessionId where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId} and AcademicYear = ${AcademicYear} and Semester = ${Semester}) = Schedule.ClassId;`;	
	return db.load(sql)
}
