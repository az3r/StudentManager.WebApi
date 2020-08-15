const db = require('../db/db');

exports.addScore = (score) => {
	const sql = `insert into Score(StudentId, SubjectId, Semester, AcademicYear, ScoreType, ScoreValue) values('${Score.StudentId}', '${Score.SubjectId}', '${Score.Semester}', '${Score.AcademicYear}', '${Score.ScoreType}', '${score.ScoreValue}');`;
    return db.load(sql);
}
exports.updateScore = (score) => {
	const sql = `update Score set ScoreValue = ${score.ScoreValue} where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType};`;
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
exports.getScore = (score) => {
	const sql = `select * from Score where StudentId = '${score.StudentId}' and Semester = ${score.Semester} and AcademicYear = ${score.AcademicYear} and SubjectId = ${score.SubjectId} and ScoreType = ${score.ScoreType};`;
    return db.load(sql);
}
exports.addScore = (score) => {
	const sql = `insert into Score(StudentId, SubjectId, ScoreType, ScoreValue, Semester, AcademicYear) values('${score.StudentId}', ${score.SubjectId}, ${score.ScoreType}, ${score.ScoreValue}, ${score.Semester}, ${score.AcademicYear});`;
    return db.load(sql);
}
