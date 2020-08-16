const db = require('../db/db');


exports.singleNoti = (StudentId) => {
	const sql = `select * from ClassNotification where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = ClassNotification.ClassId;`;
	return db.load(sql);
}
exports.addNoti = (noti) => {
	const sql = `insert into ClassNotification(CreateOn, ClassId, Title, Content) values('${noti.CreateOn}','${ClassId}', '${Title}', '${Content}');`;
	return db.load(sql);
}
