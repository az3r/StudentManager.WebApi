const db = require('../db/db');

exports.loadAll = () => {
	const sql=`select Teacher.TeacherId, SchoolRole.RoleName, Subject.SubjectId, Subject.SubjectName, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday from Teacher join PersonalInfo on Teacher.TeacherId = PersonalInfo.PersonalInfoId join SchoolRole on Teacher.RoleId = SchoolRole.RoleId join Subject on Teacher.SubjectId = Subject.SubjectId;`;
	return db.load(sql);
}
exports.listSubject = () => {
	const sql= `select Teacher.TeacherId, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName, Subject.SubjectId, Subject.SubjectName from teacher join PersonalInfo on Teacher.TeacherId = PersonalInfo.PersonalInfoId join Subject on Teacher.SubjectId = Subject.SubjectId ORDER BY Subject.SubjectId`;
	return db.load(sql);
}
exports.loadAllSubject = () => {
	const sql = `select * from Subject ORDER BY SubjectId`;
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
 				insert into Teacher(TeacherId, SubjectId, RoleId) values('${teacher.TeacherId}', ${teacher.SubjectId}, '5000000001');
 				insert into Account(PersonalInfoId, Password) values('${teacher.TeacherId}', '${teacher.Password}')`;
    return db.load(sql);
}
exports.update = teacher => {
	let sql = ` update Teacher set SubjectId = ${teacher.SubjectId} where TeacherId = '${teacher.TeacherId}';
				update PersonalInfo set Address = '${teacher.Address}', LastName = '${teacher.LastName}', MiddleName = '${teacher.MiddleName}', FirstName = '${teacher.FirstName}', Email = '${teacher.Email}', PhoneNumber = '${teacher.PhoneNumber}', IsMale = ${teacher.IsMale}, Birthday = '${teacher.Birthday}' where PersonalInfoId = '${teacher.TeacherId}';`;
 	return db.load(sql);
}