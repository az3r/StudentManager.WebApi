const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');
const scoreRepo = require('../models/scoreRepo');
const jwtt = require('../auth/jsonwebtoken');

//GET
router.get('/', jwtt.tokenVerify,(req, res) =>{
 //  	studentRepo.loadAll().then(rows => {
	// 	//console.log(rows.recordset[0].Ten);
	// 	return res.status(200).json(rows.recordset);
	// })
	return res.sendStatus(200);
})
router.get('/single/:id', jwtt.tokenVerify,(req, res) =>{
	studentRepo.singleStudent(req.params.id).then(rows => {
		return res.status(200).json(rows.recordset[0]);
	})
})
router.get('/score/:id', jwtt.tokenVerify,(req, res) =>{
	scoreRepo.singleScore(req.params.id, req.query.sem, req.query.year).then(rows => {
		let i = 0, records = []
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable score!"
			});
		}else{
			for (i; i<rows.recordset.length; i++){
				let record = {
					StudentId: rows.recordset[i].StudentId,
					SubjectName: rows.recordset[i].SubjectName,
					StudentId: rows.recordset[i].StudentId,
					Test15: [rows.recordset[i].Test15No1, rows.recordset[i].Test15No2, rows.recordset[i].Test15No3],
					Test45: [rows.recordset[i].Test45No1, rows.recordset[i].Test45No2],
					TestFinal: rows.recordset[i].TestFinal,
					Final: rows.recordset[i].Final
				}
				records[i] = record;
			}
			return res.status(200).json(records);
		}
	})
})
router.get('/schedule/:id', jwtt.tokenVerify,(req, res) =>{
	studentRepo.singleTimeTable(req.params.id, req.query.sem, req.query.year).then(rows => {
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable schedule!"
			});
		}
		return res.status(200).json(rows.recordset);
	})
})
router.get('/noti/:id', jwtt.tokenVerify,(req, res) =>{
	studentRepo.singleNoti(req.params.id).then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows.recordset);
	})
})
router.get('/feedback/:id', jwtt.tokenVerify,(req, res) =>{
	studentRepo.singleFb(req.params.id, req.query.sem, req.query.year).then(rows => {
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable feedback!"
			});
		}
		return res.status(200).json(rows.recordset);
	})
})

//POST
router.post('/add', (req, res) =>{
 //  	const student = {
	// 	StudentId:"1712913",
	// 	FirstName: "Nguyen",
	// 	LastName: "Vinh"
	// };
	const student = req.body;
	studentRepo.add(student).then(result => {
		studentRepo.singleStudent(student.StudentId).then(rows => {
			// console.log(rows.recordset[0].Ten)
			return res.status(200).json(rows.recordset);
	    })
	})
})

module.exports = router;