const db = require('../db/db');

exports.loadAll = () => {
	const sql="select * from Account";
	return db.load(sql);
}

exports.singleId = (id) => {
	const sql=`select PersonalInfo.*, Account.Password, Account.IsActivated from Account join PersonalInfo on Account.PersonalInfoId = PersonalInfo.PersonalInfoId where Account.PersonalInfoId = '${id}'`;
	return db.load(sql);
}