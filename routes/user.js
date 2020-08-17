const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt-nodejs');
const userRepo = require('../models/userRepo');
const jwtt = require('../auth/jsonwebtoken');

router.post('/login', (req, res) =>{
	let body = req.body;
	userRepo.singleId(body.PersonalInfoId).then(rows =>{
		if(!rows.recordset)
		{
			return res.status(403).json({
				success: 0,
				message: "Wrong password or user id!"
			});
		}
		if(!bcrypt.compareSync(body.Password, rows.recordset[0].Password))
		{
			return res.status(403).json({
				success: 0,
				message: "Wrong password or user id!"
			});
		}
		delete rows.recordset[0].Password;
		if(rows.recordset[0].PersonalInfoId == '0000000')	rows.recordset[0].PersonTypeId = 3;
		jwt.sign({ PersonalInfoId: rows.recordset[0].PersonalInfoId }, 'shhhh', { expiresIn: '200s' },(err, token) => {
			return res.status(200).json({
				token: token,
				personalInfo: rows.recordset[0]
			})
		});
	})
	.catch(function(e) {
  		return res.status(403).json({
  			success: 0,
			message: "Wrong password or user id!"
  		})
  	});
});
router.post('/changepassword', jwtt.tokenVerify, (req, res) =>{
	body = req.body;
	body.PersonalInfoId = req.PersonalInfoId;
	body.Password = bcrypt.hashSync(body.Password, null, null);
	userRepo.singleId(body.PersonalInfoId).then(rows =>{
		userRepo.changePassword(body).then(rows2 =>{
			delete rows.recordset[0].Password;
			return res.status(200).json(rows.recordset[0]);
		})
	})
	.catch(function(e) {
  		return res.status(403).json({
  			success: 0,
			message: "Wrong password!"
  		})
  	});
});

module.exports = router;