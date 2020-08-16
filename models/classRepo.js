const db = require('../db/db');

exports.loadAllClass = () => {
	const sql="select distinct Class.ClassId, Class.ClassName from EnrolledClass join Class on EnrolledClass.ClassId = Class.ClassId";
	return db.load(sql);
}