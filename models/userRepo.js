const db = require('../db/db');

exports.loadAll = () => {
	const sql="select * from Account";
	return db.load(sql);
}

exports.singleId = (id) => {
	const sql=`select * from Account where PersonalInfoId = '${id}'`;
	return db.load(sql);
}