const db = require('../db/db');

exports.listClass = (TeacherId, sem, year) => {
	const sql= `select distinct Schedule.ClassId, e.SumStudent, CONCAT(PersonalInfo.LastName, ' ', PersonalInfo.MiddleName, ' ' ,PersonalInfo.FirstName) as 'HomeroomTeacherName' from Schedule join (select EnrolledClass.ClassId, EnrolledClass.AcademicYear, count(*) as SumStudent from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId group by EnrolledClass.ClassId, EnrolledClass.AcademicYear) as e on Schedule.ClassId = e.ClassId
	join HomeRoom on HomeRoom.ClassId = Schedule.ClassId
	join PersonalInfo on PersonalInfo.PersonalInfoId = HomeRoom.TeacherId
	where Schedule.TeacherId = '${TeacherId}' and Schedule.Semester = ${sem} and Schedule.AcademicYear = ${year}`;
	return db.load(sql);
}
exports.schedule = (TeacherId, sem, year) => {
	const 	sql = `select Session.SessionId, CONVERT(VARCHAR(5),Session.BeginTime) as BeginTime, CONVERT(VARCHAR(5),Session.EndTime) as EndTime, DayOfWeek, Subject.SubjectName, ClassId, Room.RoomName, Semester, AcademicYear from Schedule join Subject on Schedule.SubjectId = Subject.SubjectId join Room on Schedule.RoomId = Room.RoomId join Session on Schedule.SessionId = Session.SessionId where Schedule.TeacherId = '${TeacherId}' and Semester = ${sem} and AcademicYear = ${year};`;
	return db.load(sql);
}
exports.single = (TeacherId) => {
	const sql=`select Teacher.TeacherId, SchoolRole.RoleName, Subject.SubjectId, Subject.SubjectName, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday from Teacher join PersonalInfo on Teacher.TeacherId = PersonalInfo.PersonalInfoId join SchoolRole on Teacher.RoleId = SchoolRole.RoleId join Subject on Teacher.SubjectId = Subject.SubjectId where Teacher.TeacherId=${TeacherId};`;
	return db.load(sql);
}
exports.max = ()=>{
	const sql = `SELECT MAX(TeacherId) as MAX FROM Teacher`;
	return db.load(sql);
}
exports.add = teacher => {
	let sql = `insert into PersonalInfo(PersonalInfoId, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, Birthday, PersonTypeId) values('${teacher.TeacherId}', '${teacher.Address}', '${teacher.LastName}', '${teacher.MiddleName}', '${teacher.FirstName}', '${teacher.Email}','${teacher.PhoneNumber}', ${teacher.IsMale},'${teacher.Birthday}', 2);
 				insert into Teacher(TeacherId, SubjectId, RoleId) values('${teacher.TeacherId}', ${teacher.SubjectId}, 5000000001);
 				`;
    return db.load(sql);
}