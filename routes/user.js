const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt-nodejs');
const userRepo = require('../models/userRepo')

router.post('/post', verifyToken, (req, res) =>{
	jwt.verify(req.token, 'shhhh', (err, authData) => {
		if(err) {
			res.sendStatus(403);
		}else{
			res.json({
				message: 'Post created...',
				authData: authData
			})
		}
	});

});

router.post('/login', (req, res) =>{
	const user = {
		id: 1140713,
		username: 'brad',
		email: 'brad@gmail.com'
	}
	if(user){
		jwt.sign({user}, 'shhhh', { expiresIn: '30s' },(err, token) => {
			res.json({
				token
			})
		});
	}
});

// Format token
// Authorization: Bearer <access_token>
// VerifyToken
function verifyToken(req, res, next)
{
	//get auth header value
	const bearerHeader = req.headers['authorization'];
	if(typeof bearerHeader !== 'undefined'){
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

// function signup(req, res, next)
// {
// 	let body = req.body;
// 	body.password = bcrypt.hashSync(body.password, null, null);
// 	userRepo.signUpUser(body).then(rows => {
// 		body.id = rows.insertId;
// 		return done(null, newUserMysql);
// 	}
// }
module.exports = router;