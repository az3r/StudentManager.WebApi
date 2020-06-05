const express = require('express');
const router = express.Router();
const studentRepo = require('../models/studentRepo');

router.get('/', (req, res) =>{
  	studentRepo.loadAll().then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows);
	})
})
router.get('/single', (req, res) =>{
	studentRepo.singleStudent(1712913).then(rows => {
		//console.log(rows.recordset[0].Ten);
		return res.status(200).json(rows);
	})
})
router.post('/add', (req, res) =>{
  	const student = {
		MSSV:"00006",
		Ho: "Le",
		Ten: "Tuan"
	};
	studentRepo.add(student).then(result => {
		studentRepo.singleStudent(student.MSSV).then(rows => {
			// console.log(rows.recordset[0].Ten)
			return res.status(200).json(rows);
	    })
	})
})

module.exports = router;