const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');
const scoreRepo = require('../models/scoreRepo');
const teacherRepo = require('../models/teacherRepo');
const feedbackRepo = require('../models/feedbackRepo');
const notiRepo = require('../models/notiRepo');
const jwtt = require('../auth/jsonwebtoken');

router.get('/allclass', jwtt.tokenVerify,(req, res) =>{
	studentRepo.loadAllClass().then(rows => {
		return res.status(200).json(rows.recordset);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})	
});

router.get('/allsubject', jwtt.tokenVerify, (req, res) =>{
	studentRepo.loadAllSubject().then(rows =>{
		return res.status(200).json(rows.recordset[0]);
	})
})
router.post('/addnoti', jwtt.tokenVerify, (req, res)=>{
	const noti = req.body;
	notiRepo.addNoti(noti).then(rows =>{
		return res.sendStatus(200);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})	
});

router.post('/addstudent', jwtt.tokenVerify, (req, res) =>{
	const student = req.body;
	studentRepo.max().then(resultMax => {
		student.StudentId = (parseInt(resultMax.recordset[0].MAX) + 1).toString(10);
		const d = new Date();
		student.AcademicYear = d.getFullYear();
		studentRepo.add(student).then(result => {
			studentRepo.singleStudent(student.StudentId).then(rows => {
				return res.status(200).json(rows.recordset[0]);
		    })
		})
	})
})
router.post('/addteacher', jwtt.tokenVerify, (req, res) =>{
	const teacher = req.body;
	teacherRepo.max().then(resultMax => {
		teacher.TeacherId = (parseInt(resultMax.recordset[0].MAX) + 1).toString(10);
		while(teacher.TeacherId.length < 7)
			teacher.TeacherId = "0" + teacher.TeacherId;
		teacherRepo.add(teacher).then(result => {
			teacherRepo.single(teacher.TeacherId).then(rows => {
				return res.status(200).json(rows.recordset[0]);
		    })
		})
	})
})
module.exports = router;
