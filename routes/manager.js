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

module.exports = router;
