const db = require('../db/db');


exports.singleNoti = (StudentId) => {
	let sql = `select * from ClassNotification where (select ClassId from Student join EnrolledClass on Student.StudentId = EnrolledClass.StudentId where Student.StudentId = ${StudentId}) = ClassNotification.ClassId OR ClassNotification.ClassId = 'FULL';`;
	return db.load(sql);
}
exports.addNoti = (noti) => {
	const sql = `insert into ClassNotification(CreatedOn, ClassId, Title, Content) values('${noti.CreatedOn}','${noti.ClassId}', '${noti.Title}', '${noti.Content}');`;
	return db.load(sql);
}
exports.loadAllNoti = () =>{
	const sql = `select * from ClassNotification;`;
	return db.load(sql);
}
exports.update = (noti) =>{
	const sql = `update ClassNotification set CreatedOn = '${noti.CreatedOn}', ClassId = '${noti.ClassId}',  Title = '${noti.Title}', Content = '${noti.Content}' OUTPUT inserted.NotificationId, inserted.CreatedOn, inserted.ClassId, inserted.Title, inserted.Content where NotificationId = ${noti.NotificationId}`;
	return db.load(sql);
}