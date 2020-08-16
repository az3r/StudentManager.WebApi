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
				account: rows.recordset[0]
			})
		});
	})
	.catch(function(e) {
  		console.log(e);
  	});
});

// Format token
// Header should be: Authorization: Bearer <access_token>
// VerifyToken
function verifyToken(req, res, next)
{
	//get auth header value
	const bearerHeader = req.headers['authorization'];
	if(typeof bearerHeader !== 'undefined'){
		//split Bearer <access_token> from space
		const bearer = bearerHeader.split(' ');
		// Get token from array
		req.token = bearer[1];
		next();
	}
	else{
		// Forbidden
		res.sendStatus(403);
	}
}
module.exports = router;