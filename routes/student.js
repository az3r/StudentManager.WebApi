const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');
//GET
router.get('/', (req, res) =>{
  	studentRepo.loadAll().then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows);
	})
})
router.get('/class/:id', (req, res) =>{
	studentRepo.loadStudentInClass(req.params.id).then(rows => {
		return res.status(200).json(rows);
	})
})
router.get('/single/:id', (req, res) =>{
	studentRepo.singleStudent(req.params.id).then(rows => {
		return res.status(200).json(rows);
	})
})
router.get('/score/:id', (req, res) =>{
	studentRepo.singleScore(req.params.id, req.query.sem, req.query.year).then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows);
	})
})
router.get('/schedule/:id', (req, res) =>{
	studentRepo.singleTimeTable(req.params.id).then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows);
	})
})
//POST
router.post('/add', (req, res) =>{
  	const student = {
		StudentId:"1712913",
		Ho: "Nguyen",
		Ten: "Vinh"
	};
	studentRepo.add(student).then(result => {
		studentRepo.singleStudent(student.MSSV).then(rows => {
			// console.log(rows.recordset[0].Ten)
			return res.status(200).json(rows);
	    })
	})
})

module.exports = router;