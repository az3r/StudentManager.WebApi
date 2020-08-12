const express = require('express');
const router = express.Router()
router.get('/', (req, res) =>{
	return res.sendStatus(200);
})
router.use("/student", require("./student"));
router.use("/user", require("./user"));
router.use("/teacher", require("./teacher"));
module.exports = router;