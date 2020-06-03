const studentRepo = require('../models/studentRepo');

module.exports.getAllStudent = function(req, res, next) {
	studentRepo.loadAll().then(rows => {
		//console.log(rows.recordset[0].Ten);
		res.writeHead(200, { "Content-Type": "application/json" });
		res.write(JSON.stringify(rows));
		res.end();
	})
}
module.exports.getStudent = function(req, res, next) {
	studentRepo.singleStudent(1712913).then(rows => {
		//console.log(rows.recordset[0].Ten);
		res.writeHead(200, { "Content-Type": "application/json" });
		res.write(JSON.stringify(rows));
		res.end();
	})
}
module.exports.addStudent = function(req, res){
	const student = {
		MSSV:"00004",
		Ho: "Le",
		Ten: "Vinh"
	};
	studentRepo.add(student).then(result => {
		studentRepo.singleStudent(student.MSSV).then(rows => {
			// console.log(rows.recordset[0].Ten)
			res.writeHead(200, { "Content-Type": "application/json" });
			res.write(JSON.stringify(rows));
			res.end();
	    })
	})
}