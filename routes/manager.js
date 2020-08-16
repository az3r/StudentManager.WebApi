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
router.get('/allteacher', jwtt.tokenVerify, (req, res) =>{
	teacherRepo.loadAll().then(rows=>{
		return res.status(200).json(rows.recordset);
	})
});
router.get('/allstudent', jwtt.tokenVerify,(req, res) =>{
	studentRepo.loadAllStudent(req.query.year).then(rows => {
		return res.status(200).json(rows.recordset);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})	
});
router.get('/allnoti', jwtt.tokenVerify,(req, res) =>{
	notiRepo.loadAllNoti().then(rows => {
		return res.status(200).json(rows.recordset);
	})
});
router.get('/allsubject', jwtt.tokenVerify, (req, res) =>{
	studentRepo.loadAllSubject().then(rows =>{
		return res.status(200).json(rows.recordset);
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
	if(typeof student.IsMale == 'string')
		student.IsMale = parseInt(student.IsMale);
	if(typeof student.IsGraduated == 'string')
		student.IsMale = parseInt(student.IsGraduated);
	studentRepo.max().then(resultMax => {
		student.StudentId = (parseInt(resultMax.recordset[0].MAX) + 1).toString(10);
		const d = new Date();
		student.AcademicYear = d.getFullYear();
		studentRepo.add(student).then(result => {
			studentRepo.singleStudent(student.StudentId).then(rows => {
				return res.status(200).json(rows.recordset[0]);
		    })
		})
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
router.post('/addteacher', jwtt.tokenVerify, (req, res) =>{
	const teacher = req.body;
	if(typeof teacher.IsMale == "string")
		teacher.IsMale = parseInt(teacher.IsMale);
	if(typeof teacher.SubjectId == "string")
		teacher.SubjectId = parseInt(teacher.SubjectId);
	teacherRepo.max().then(resultMax => {
		teacher.TeacherId = (parseInt(resultMax.recordset[0].MAX) + 1).toString(10);
		while(teacher.TeacherId.length < 7)
			teacher.TeacherId = "0" + teacher.TeacherId;
		teacherRepo.add(teacher).then(result => {
			teacherRepo.single(teacher.TeacherId).then(rows => {
				return res.status(200).json(rows.recordset[0]);
		    })
		})
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
});
router.post('/updateteacher', jwtt.tokenVerify, (req, res) =>{
	const teacher = req.body;
	if(typeof teacher.IsMale == "string")
		teacher.IsMale = parseInt(teacher.IsMale);
	if(typeof teacher.SubjectId == "string")
		teacher.SubjectId = parseInt(teacher.SubjectId);
	teacherRepo.update(teacher).then(result => {
		teacherRepo.single(teacher.TeacherId).then(rows => {
			return res.status(200).json(rows.recordset[0]);
	    })
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
router.post('/updatestudent', jwtt.tokenVerify, (req, res) =>{
	const student = req.body;
	if(typeof student.IsMale == 'string')
		student.IsMale = parseInt(student.IsMale);
	if(typeof student.IsGraduated == 'string')
		student.IsMale = parseInt(student.IsGraduated);
	studentRepo.update(student).then(result => {
		studentRepo.singleStudent(student.StudentId).then(rows => {
			return res.status(200).json(rows.recordset[0]);
	    })
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})	
})
router.post('/updatenoti', jwtt.tokenVerify, (req, res) =>{
	const noti = req.body;
	if(typeof noti.NotificationId == 'string')
		noti.NotificationId = parseInt(noti.NotificationId);
	notiRepo.update(noti).then(rows =>{
		return res.status(200).json(rows.recordset[0]);
	})
})
module.exports = router;