const db = require('../db/db');

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
exports.addfeedback = (feedback) => {
	const sql = `insert into Feedback(FeedbackId, StudentId, Conduct , Feedback, Semester, AcademicYear) values('${feedback.FeedbackId}', '${feedback.StudentId}', '${feedback.Conduct}', ${feedback.Feedback}, ${score.Semester}, ${score.AcademicYear});`;
    return db.load(sql);
}