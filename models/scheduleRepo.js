const db = require('../db/db');


exports.singleSchedule = (Schedule) => {
	let sql = `select * from Schedule where`; 
	return db.load(sql);
}
exports.addNoti = (noti) => {
	const sql = `insert into ClassNotification(CreatedOn, ClassId, Title, Content) values('${noti.CreatedOn}','${noti.ClassId}', '${noti.Title}', '${noti.Content}');`;
	return db.load(sql);
}
expor