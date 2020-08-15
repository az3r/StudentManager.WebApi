const db = require('../db/db');

exports.singleFb = (StudentId, Semester, AcademicYear) => {
	let sql = `select StudentId, Feedback, Conduct, Semester, AcademicYear from Feedback where Feedback.StudentId = '${StudentId}' `
	if(Semester != null)
		sql = sql + `and Feedback.Semester = ${Semester} `;
	if(AcademicYear != null)	
		sql = sql + `and Feedback.AcademicYear = ${AcademicYear} `
	return db.load(sql);
}
exports.addfeedback = (feedback) => {
	const sql = `insert into Feedback(FeedbackId, StudentId, Conduct , Feedback, Semester, AcademicYear) values('${feedback.FeedbackId}', '${feedback.StudentId}', 'A', '${feedback.Feedback}', ${feedback.Semester}, ${feedback.AcademicYear});`;
    return db.load(sql);
}