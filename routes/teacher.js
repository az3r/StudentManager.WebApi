const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');
const scoreRepo = require('../models/scoreRepo');
const teacherRepo = require('../models/teacherRepo');
const jwtt = require('../auth/jsonwebtoken');


//GET
router.get('/single/:id', jwtt.tokenVerify,(req, res) =>{
	teacherRepo.single(req.params.id).then(rows => {
		return res.status(200).json(rows.recordset[0]);
	})
})

router.get('/listclass/:id', jwtt.tokenVerify,(req, res) =>{
	teacherRepo.listClass(req.params.id, req.query.sem, req.query.year).then(rows => {
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable class!"
			});
		}else{
			return res.status(200).json(rows.recordset);
		}
	})
});



router.get('/schedule/:id', jwtt.tokenVerify,(req, res) =>{
	teacherRepo.schedule(req.params.id, req.query.sem, req.query.year).then(rows => {
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable schedule!"
			});
		}
		return res.status(200).json(rows.recordset);
	})
})

router.get('/class/:id', jwtt.tokenVerify,(req, res) =>{
	studentRepo.loadStudentInClass(req.params.id, req.query.year).then(rows => {
		return res.status(200).json(rows.recordset);
	})
})

router.get('/listscore/:id', jwtt.tokenVerify,(req, res) =>{
	scoreRepo.listStudentAndScore(req.params.id, req.query.class, req.query.sem, req.query.year).then(rows => {
		let i = 0, records = []
		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
			return res.status(403).json({
				success: 0,
				message: "Unavailable score!"
			});
		}else{
			for (i; i<rows.recordset.length; i++){
				let record = {
					ClassId: rows.recordset[i].ClassId,
					StudentId: rows.recordset[i].StudentId,
					LastName: rows.recordset[i].LastName,
					MiddleName: rows.recordset[i].MiddleName,
					FirstName: rows.recordset[i].FirstName,
					Email: rows.recordset[i].Email,
					Birthday: rows.recordset[i].Birthday,
					Address: rows.recordset[i].Address,
					IsMale: rows.recordset[i].IsMale,
					PhoneNumber: rows.recordset[i].PhoneNumber,
					StudentId: rows.recordset[i].StudentId,
					StudentId: rows.recordset[i].StudentId,
					Test15: [rows.recordset[i].Test15No1, rows.recordset[i].Test15No2, rows.recordset[i].Test15No3],
					Test45: [rows.recordset[i].Test45No1, rows.recordset[i].Test45No2],
					TestFinal: rows.recordset[i].TestFinal,
					Final: rows.recordset[i].Final,
					Semester: rows.recordset[i].Semester,
					AcademicYear: rows.recordset[i].AcademicYear
				}
				records[i] = record;
			}
			return res.status(200).json(records);
		}
	})
})

// router.get('/noti/:id', jwtt.tokenVerify,(req, res) =>{
// 	studentRepo.singleNoti(req.params.id).then(rows => {
// 		//console.log(rows.recordset[0].Ten);
// 		return res.status(200).json(rows.recordset);
// 	})
// })
// router.get('/feedback/:id', jwtt.tokenVerify,(req, res) =>{
// 	studentRepo.singleFb(req.params.id, req.query.sem, req.query.year).then(rows => {
// 		if(typeof rows.recordset === 'undefined' || !rows.recordset.length){
// 			return res.status(403).json({
// 				success: 0,
// 				message: "Unavailable feedback!"
// 			});
// 		}
// 		return res.status(200).json(rows.recordset);
// 	})
// })

//POST
router.post('/addscore', (req, res) => {
	const score = req.body;
	scoreRepo.addScore(score).then(result => {
		teacherRepo.singleScore(score).then(rows => {
			return res.status(200).json(rows.recordset);
	    })
	}).catch(function(e) {
		console.log(e);
	})	
})
router.post('/updatescore', (req, res) => {
	const score = req.body;
	scoreRepo.updateScore(score).then(result => {
		scoreRepo.getScore(score).then(rows => {
			return res.status(200).json(rows.recordset);
	    })
	})
});
router.post('/addfeedback', (req, res) => {
	const score = req.body;
	score.FeedbackId = score.
	scoreRepo.updateScore(score).then(result => {
		scoreRepo.getScore(score).then(rows => {
			return res.status(200).json(rows.recordset);
	    })
	})
});
router.post('/addmultiscore', (req, res) => {
	let score = req.body;
	
});
module.exports = router;
