const jwt = require('jsonwebtoken');

exports.tokenVerify = (req, res, next) => {
	//get auth header value
	const bearerHeader = req.headers['authorization'];
	if(typeof bearerHeader !== 'undefined'){
		//split Bearer <access_token> from space
		const bearer = bearerHeader.split(' ');
		// Get token from array
		req.token = bearer[1];
		jwt.verify(req.token, 'shhhh', (err, authData) => {
			if(err) {
				res.status(403).json({
					success: 0,
					message: "Invalid Token"
				});
			}else{
				req.PersonalInfoId = authData.PersonalInfoId;
				next();
			}
		});
	}else{
		res.status(403).json({
			success: 0,
			message: "Access denied! Unauthorization user"
		});
	}
}