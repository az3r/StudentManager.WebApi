const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');
const scoreRepo = require('../models/scoreRepo');
const classRepo = require('../models/classRepo');
const teacherRepo = require('../models/teacherRepo');
const scheduleRepo = require('../models/scheduleRepo');
const feedbackRepo = require('../models/feedbackRepo');
const notiRepo = require('../models/notiRepo');
const jwtt = require('../auth/jsonwebtoken');
const bcrypt = require('bcrypt-nodejs');

router.get('/allclass', jwtt.tokenVerify,(req, res) =>{
	classRepo.loadAllClass().then(rows => {
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
router.get('/allsubject', jwtt.tokenVerify, (req, res) =>{
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
	teacherRepo.loadAllSubject().then(rows =>{
		return res.status(200).json(rows.recordset);
	})
})
router.get('/listsubject', jwtt.tokenVerify, (req, res) =>{
	var sb = [];
	teacherRepo.listSubject().then(rows =>{
		let j = 0;
		for(let i=1;i<=9;i++)
		{	
			let a = {
				SubjectId: i, 
				SubjectName: rows.recordset[j].SubjectName,
				Teachers:[]
				};
			for(j;  j< rows.recordset.length; j++)
			{
				if(rows.recordset[j].SubjectId == i)
				{	
					let teacher = {
						TeacherId: rows.recordset[j].TeacherId,
						LastName: rows.recordset[j].LastName,
						MiddleName: rows.recordset[j].MiddleName,
						FirstName: rows.recordset[j].FirstName
					}
					a.Teachers.push(teacher);
				}
				else break;
			}
			sb.push(a);
		}
		return res.status(200).json(sb);	
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
router.get('/liststudent/:id', jwtt.tokenVerify, (req, res) =>{
	classRepo.listStudentInClass(req.params.id, req.query.year).then(rows =>{
		return res.status(200).json(rows.recordset);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
// from classid
router.get('/listschedule/:id', jwtt.tokenVerify, (req, res) =>{
	scheduleRepo.getScheduleFromClassId(req.params.id, req.query.sem, req.query.year).then(rows =>{
		return res.status(200).json(rows.recordset);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
router.get('/listroom', jwtt.tokenVerify, (req, res) =>{
	classRepo.listRoom().then(rows =>{
		return res.status(200).json(rows.recordset);
	})
	.catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
})
//	POST
router.post('/addstudent', jwtt.tokenVerify, (req, res) =>{
	const student = req.body;
	if(typeof student.IsMale == 'string')
		student.IsMale = parseInt(student.IsMale);
	if(typeof student.IsGraduated == 'string')
		student.IsMale = parseInt(student.IsGraduated);
	studentRepo.max().then(resultMax => {
		student.StudentId = (parseInt(resultMax.recordset[0].MAX) + 1).toString(10);
		student.Password = bcrypt.hashSync(student.StudentId, null, null);
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
		teacher.Password = bcrypt.hashSync(teacher.TeacherId, null, null);
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
});
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
router.post('/updatenoti', jwtt.tokenVerify, (req, res) =>{
	let noti = req.body;
	if(typeof noti.NotificationId == 'string')
		noti.NotificationId = parseInt(noti.NotificationId);
	notiRepo.update(noti).then(rows =>{
		return res.status(200).json(rows.recordset[0]);
	})
});
router.post('/addschedule', jwtt.tokenVerify, (req, res) =>{
	let schedule = req.body;
	scheduleRepo.getRoomId(schedule.ClassId).then(result =>{
		if(result.recordset[0].RoomId != 'undefine'){
			schedule.RoomId = result.recordset[0].RoomId;
			scheduleRepo.add(schedule).then(rows =>{
				return res.sendStatus(200);
			})
		}
		else throw('please choose room')
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
});
router.post('/updateschedule', jwtt.tokenVerify, (req, res) =>{
	let schedule = req.body;
	scheduleRepo.getRoomId(schedule.ClassId).then(result =>{
		if(result.recordset[0].RoomId != 'undefine'){
			schedule.RoomId = result.recordset[0].RoomId;
			scheduleRepo.update(schedule).then(rows =>{
				scheduleRepo.singleSchedule(schedule).then(row =>{
					return res.status(200).json(row.recordset[0]);	
				})
			})
		}
		else throw('please choose room')
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
});
router.post('/addclass', jwtt.tokenVerify, (req, res) =>{
	let cl = req.body;
	classRepo.add(cl).then(rows =>{
		return res.sendStatus(200);
	}).catch(function(e) {
		console.log(e);
		return res.sendStatus(500);
	})
});

module.exports = router;