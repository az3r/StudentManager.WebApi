const db = require('../db/db');

exports.updateScore = (score) => {
	const sql = `update Score set ScoreValue = ${score.ScoreValue} where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType};`;
    return db.load(sql);
}
exports.singleScore = (StudentId, Subject, Semester, AcademicYear) => {
	let sql = `select StudentId, Subject.SubjectName, Test15No1, Test15No2, Test15No3, Test45No1, Test45No2, TestFinal, (Test15No1+Test15No2+Test15No3+2*(Test45No1+Test45No2)+3*TestFinal)/10 as Final, Semester, AcademicYear from (SELECT StudentId, SubjectId, [1] as Test15No1, [2] as Test15No2, [3] as Test15No3, [4] as Test45No1, [5] as Test45No2, [6] as TestFinal, Semester, AcademicYear FROM (SELECT StudentId, SubjectId, Semester, AcademicYear, ScoreType, ScoreValue FROM Score where StudentId = ${StudentId} `;	
	if(Semester != null)
		sql = sql + ` and Semester = ${Semester}`;
	if(AcademicYear != null)
		sql = sql + ` and AcademicYear = ${AcademicYear}`
	sql = sql + `) AS SourceTable PIVOT (Min(ScoreValue) FOR ScoreType IN ([1], [2], [3], [4], [5], [6])) AS PivotTable) as hehe join Subject on hehe.SubjectId = Subject.SubjectId`;
	if(Subject != null)
		sql = sql + ` where Subject.SubjectName = '${Subject}';`
	console.log(sql)
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
