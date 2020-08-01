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
	const sql=`select * from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId where Student.StudentId = ${MaSoFirstNamecSinh} and class.MaLop = '${MaLop}'`;
	return db.load(sql);
}
exports.loadTableOfScore = (StudentId) => {
	sql = `SELECT StudentId, SubjectId, [1] as '15pLan1', [2] as '15pLan2', [3] as '15pLan3', [4] as '1 tiet lan1', [5] as '1 tiet lan 2', [6] as 'cuoi ki' FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable;`;
	return db.load(sql);
}

exports.singleScore = (StudentId, Semester, AcademicYear) => {
	let sql=null
	// if(Semester == null && AcademicYear == null)
	// 	sql = `select st.StudentId, sj.SubjectName, sc.ScoreId, sc.ScoreType, sc.ScoreValue, sc.Semester from Student as st join Score as sc on st.StudentId = sc.StudentId join Subject as sj on sc.SubjectId = sj.SubjectId where st.StudentId = ${StudentId};`;
	// if(Semester == null && AcademicYear != null)
	// 	sql = `select st.StudentId, sj.SubjectName, sc.ScoreId, sc.ScoreType, sc.ScoreValue from Student as st join Score as sc on st.StudentId = sc.StudentId join Subject as sj on sc.SubjectId = sj.SubjectId where st.StudentId = ${StudentId} and sc.AcademicYear = ${AcademicYear};`;
	// if(Semester != null && AcademicYear != null)
	// 	sql = `select sj.SubjectName, sc.ScoreId, sc.ScoreType, sc.ScoreValue from Student as st join Score as sc on st.StudentId = sc.StudentId join Subject as sj on sc.SubjectId = sj.SubjectId where st.StudentId = ${StudentId} and sc.Semester = ${Semester} and sc.AcademicYear = ${AcademicYear};`;
	//	sql = `SELECT StudentId, SubjectId, [1] as '15pLan1', [2] as '15pLan2', [3] as '15pLan3', [4] as '1 tiet lan1', [5] as '1 tiet lan 2', [6] as 'cuoi ki' FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable;`;
	sql = `select*, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe;`;

	return db.load(sql)
}
exports.singleCondult = (StudentId) => {
	const sql = `select * from Student as st join Condult as sc on st.StudentId = sc.StudentId where st.StudentId = ${StudentId};`;
	return db.load(sql)
}
exports.singleTimeTable = (StudentId) => {
	const sql = `select * from Schedule where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = Schedule.ClassId;`;
	return db.load(sql)
}
exports.singleNoti = (StudentId) => {
	const sql = `select * from ClassNotification where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = ClassNotification.ClassId;`;
	return db.load(sql)
}
