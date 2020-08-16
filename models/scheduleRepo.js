const db = require('../db/db');

exports.getRoomId = (ClassId)=>{
	let sql = `select RoomId from Room where RoomName = '${ClassId}'`;
	return db.load(sql);
} 
exports.singleSchedule = (sc) => {
	let sql = `select * from Schedule as s where s.SessionId = '${sc.SessionId}' and s.Semester = ${sc.Semester} and ${sc.AcademicYear} = s.AcademicYear and s.DayOfWeek = ${sc.DayOfWeek} and TeacherId = '${sc.TeacherId}' and ClassId = '${sc.ClassId}'`; 
	return db.load(sql);
}
exports.add = (sc) => {
	let sql = `insert into schedule(SessionId, SubjectId, TeacherId, ClassId, RoomId, Semester, AcademicYear, DayOfWeek) values(${sc.SessionId}, ${sc.SubjectId}, '${sc.TeacherId}', '${sc.ClassId}', '${sc.RoomId}', ${sc.Semester}, ${sc.AcademicYear}, ${sc.DayOfWeek});`
	return db.load(sql);
}
exports.update = (sc) => {
	let sql = `update schedule set ClassId = '${sc.ClassId}', SubjectId = ${sc.SubjectId} where SessionId = ${sc.SessionId} and Semester = ${sc.Semester} and AcademicYear = ${sc.AcademicYear} and DayOfWeek = ${sc.DayOfWeek} and TeacherId = '${sc.TeacherId}';`
	return db.load(sql);
}