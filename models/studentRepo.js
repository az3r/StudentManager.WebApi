const db = require('../db/db');

exports.loadAll = () => {
	const sql="select * from Student";
	return db.load(sql);
}
exports.singleStudent = (StudentId) => {
	const sql=`select Student.StudentId, IsGraduated, Address, LastName, MiddleName, FirstName, Email, PhoneNumber, IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday, EnrolledClass.ClassId from Student join PersonalInfo on Student.StudentId = PersonalInfo.PersonalInfoId join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId=${StudentId};`;
	return db.load(sql);
}
exports.add = student => {
    var sql = `insert into Student(StudentId, FirstName, LastName) values('${student.StudentId}', '${student.FirstName}', '${student.LastName}');`;
    return db.load(sql);
}
exports.loadStudentInClass = (ClassId) => {
	const sql=`select EnrolledClass.ClassId, Student.StudentId, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName, PersonalInfo.IsMale, CONVERT(VARCHAR(10), PersonalInfo.Birthday) as Birthday from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId join PersonalInfo on Student.StudentId = PersonalInfo.PersonalInfoId where EnrolledClass.ClassId = '${ClassId}';`
	return db.load(sql);
}
exports.loadTableOfScore = (StudentId) => {
	sql = `select StudentId, Subject.SubjectName, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId;`;
	return db.load(sql);
}
exports.singleFb = (StudentId, Semester, AcademicYear) => {
	let sql=null
	if(Semester == null && AcademicYear == null)
		sql = `select StudentId, Feedback, Conduct, Semester, AcademicYear from Feedback where Feedback.StudentId = '${StudentId}'`;
	if(Semester == null && AcademicYear != null)
		sql = `select StudentId, Feedback, Conduct, Semester, AcademicYear from Feedback where Feedback.StudentId = '${StudentId}' and Feedback.AcademicYear = ${AcademicYear}`;
	if(Semester != null && AcademicYear != null)
		sql = `select StudentId, Feedback, Conduct, Semester, AcademicYear from Feedback where Feedback.StudentId = '${StudentId}' and Feedback.AcademicYear = ${AcademicYear} and Feedback.Semester = ${Semester}`;
	return db.load(sql);
}

exports.singleScore = (StudentId, Semester, AcademicYear) => {
	let sql=null
	if(Semester == null && AcademicYear == null)
		sql = `select StudentId, Subject.SubjectName, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId;`;
	if(Semester == null && AcademicYear != null)
		sql = `select StudentId, Subject.SubjectName, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = 1 and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId;`;
	if(Semester != null && AcademicYear != null)
	//	sql = `SELECT StudentId, SubjectId, [1] as '15pLan1', [2] as '15pLan2', [3] as '15pLan3', [4] as '1 tiet lan1', [5] as '1 tiet lan 2', [6] as 'cuoi ki' FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable;`;
		sql = `select StudentId, Subject.SubjectName, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal FROM (SELECT StudentId, SubjectId, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} and Semester = ${Semester} and AcademicYear = ${AcademicYear}) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId;`;

	return db.load(sql)
}
exports.singleCondult = (StudentId) => {
	const sql = `select * from Student as st join Feedback as fb on st.StudentId = fb.StudentId where st.StudentId = ${StudentId};`;
	return db.load(sql)
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
exports.singleNoti = (StudentId) => {
	const sql = `select * from ClassNotification where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = ClassNotification.ClassId;`;
	return db.load(sql)
}

exports.addScore = (score) => {
	const sql = `insert into Score(StudentId, SubjectId, Semester, AcademicYear, ScoreType, ScoreValue) values('${Score.StudentId}', '${Score.SubjectId}', '${Score.Semester}', '${Score.AcademicYear}', '${Score.ScoreType}', '${score.ScoreValue}');`;
    return db.load(sql);
}
