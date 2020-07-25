const db = require('../db/db');

exports.loadAll = () => {
	const sql="select * from Student";
	return db.load(sql);
}
exports.singleStudent = (StudentId) => {
	const sql=`select * from Student join PersonalInfo on Student.PersonalInfoId = PersonalInfo.PersonalInfoId where StudentId=${StudentId};`;
	return db.load(sql);
}
exports.add = student => {
    var sql = `insert into Student(StudentId, FirstName, LastName) values('${student.StudentId}', '${student.FirstName}', '${student.LastName}');`;
    return db.load(sql);
}
exports.loadStudentInClass = (MaLop) => {
	const sql=`select * from EnrolledClass join Student on class.StudentId = Student.StudentId where Student.StudentId = ${MaSoFirstNamecSinh} and class.MaLop = '${MaLop}'`;
	return db.load(sql);
}
exports.loadTableOfScore = (StudentId) => {
	const sql=`select * from Student as h join Score as d join Subject as s where s.StudentId=${StudentId} and s.StudentId = d.StudentId and d.MaMonFirstNamec = s.MaMonFirstNamec;`;
	return db.load(sql);
}

exports.singleScore = (StudentId, Semester, AcademicYear) => {
	let sql=null
	if(Semester == null && AcademicYear == null)
		sql = `select * from Student as st join Score as sc on st.StudentId = sc.StudentId where st.StudentId = ${StudentId};`;
	if(Semester != null && AcademicYear != null)
		sql = `select * from Student as st join Score as sc on st.StudentId = sc.StudentId where st.StudentId = ${StudentId} and sc.Semester = ${Semester} and sc.AcademicYear = ${AcademicYear};`;
	if(Semester == null && AcademicYear != null)
		sql = `select * from Student as st join Score as sc on st.StudentId = sc.StudentId where st.StudentId = ${StudentId} and sc.AcademicYear = ${AcademicYear};`;
	return db.load(sql)
}
exports.singleCondult = (StudentId) => {
	const sql = `select * from Student as st join Condult as sc on st.StudentId = sc.StudentId where st.StudentId = ${StudentId};`;
	return db.load(sql)
}
exports.singleTimeTable = (StudentId) => {
	const sql = `select * from (select MaLop from Student join Class on Student.StudentId = Class.StudentId where Student.StudentId = ${StudentId}) as a join Schedule as b on a.class = b.class where ;`;
	return db.load(sql)
}
