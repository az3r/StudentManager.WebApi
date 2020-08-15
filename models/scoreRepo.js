const db = require('../db/db');

exports.updateScore = (score) => {
	const sql = `update Score set ScoreValue = ${score.ScoreValue} where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType};`;
    return db.load(sql);
}
exports.singleScore = (StudentId, Subject, Semester, AcademicYear) => {
	let sql = `select StudentId, Subject.SubjectName, Subject.SubjectId, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final, Semester, AcademicYear from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal, Semester, AcademicYear FROM (SELECT StudentId, SubjectId, Semester, AcademicYear, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} `;	
	if(Semester != null)
		sql = sql + ` and Semester = ${Semester}`;
	if(AcademicYear != null)
		sql = sql + ` and AcademicYear = ${AcademicYear}`
	sql = sql + `) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId`;
	if(Subject != null)
		sql = sql + ` where Subject.SubjectName = '${Subject}';`
	return db.load(sql)
}
exports.listStudentAndScore = (TeacherId, Class, Semester, AcademicYear) => {
	let sql = `select ClassId, a.StudentId, c.LastName, c.MiddleName, c.FirstName, c.Email, c.Birthday, c.Address, c.IsMale, c.PhoneNumber, hoho.Test15No1, hoho.Test15No2, hoho.Test15No3, hoho.Test45No1, hoho.Test45No2, hoho.TestFinal, hoho.Final, hoho.Semester, hoho.AcademicYear from(select distinct Schedule.ClassId, Schedule.TeacherId, Schedule.AcademicYear, Schedule.Semester, e.StudentId from Schedule 
	join (select EnrolledClass.ClassId, EnrolledClass.AcademicYear, EnrolledClass.StudentId from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId) as e 
	on Schedule.ClassId = e.ClassId where Schedule.TeacherId = '${TeacherId}' and Schedule.Semester = ${Semester} and Schedule.AcademicYear = ${AcademicYear}) as a
	join (select hehe.StudentId, hehe.SubjectId, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final, Semester, AcademicYear from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal, Semester, AcademicYear FROM (SELECT StudentId, SubjectId, Semester, AcademicYear, ScoreType, ScoreValue FROM Score) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe) as hoho on hoho.StudentId = a.StudentId and (hoho.AcademicYear = a.AcademicYear and hoho.Semester = a.Semester) join (select Subject.SubjectId, Teacher.TeacherId from Subject join Teacher on Subject.SubjectId = Teacher.SubjectId) as b on hoho.SubjectId = b.SubjectId and (b.TeacherId = a.TeacherId)
	join PersonalInfo as c on c.PersonalInfoId = hoho.StudentId`;
	if (Class != null)
		sql = sql + ` where ClassId = '${Class}';`;
	return db.load(sql)
}
exports.getScore = (score) => {
	let sql
	if(score.subjectId == null)
		sql = `select * from Score where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType};`;
    else
    	sql = `select * from Score where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId};`;
    return db.load(sql);
}
exports.addSingleScore = (score) => {
	const sql = `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score.StudentId}', ${score.SubjectId}, ${score.ScoreType}, ${score.ScoreValue}, ${score.Semester}, ${score.AcademicYear});`;
    return db.load(sql);
}
exports.addMultiScore = (score) => {
	let i = 0, sql = ``;
	for (i; i<score.length; i++)
	{
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 1, ${score[i].Test15[0]}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 2, ${score[i].Test15[1]}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 3, ${score[i].Test15[2]}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 4, ${score[i].Test45[0]}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 5, ${score[i].Test45[1]}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
		sql = sql + `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score[i].StudentId}', ${score[i].SubjectId}, 6, ${score[i].TestFinal}, ${score[i].Semester}, ${score[i].AcademicYear});
		`;
	}
	return db.load(sql);
}