const db = require('../db/db');


exports.singleNoti = (StudentId) => {
	const sql = `select * from ClassNotification where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = ClassNotification.ClassId;`;
	return db.load(sql);
}
exports.addNoti = (noti) => {
	const sql = `insert into ClassNotification(CreatedOn, ClassId, Title, Content) values('${noti.CreatedOn}','${noti.ClassId}', '${noti.Title}', '${noti.Content}');`;
	return db.load(sql);
}
