const studentRepo = require('../models/studentRepo');

module.exports.getAllStudent = function(req, res, next) {
	studentRepo.loadAll().then(rows => {
		//console.log(rows.recordset[0].Ten);
		res.writeHead(200, { "Content-Type": "application/json" });
		res.write(JSON.stringify(rows));
		res.end();
	})
}