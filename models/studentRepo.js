const db = require('../db/db');

exports.loadAll = () => {
	const sql="select * from Student";
	return db.load(sql);
}
exports.singleStudent = (mssv) => {
	const sql=`select * from Student where MSSV=${mssv};`;
	return db.load(sql);
}
exports.add = student => {
    var sql = `insert into Student(MSSV, Ho, Ten) values('${student.MSSV}', '${student.Ho}', '${student.Ten}');`;
    return db.load(sql);
}
