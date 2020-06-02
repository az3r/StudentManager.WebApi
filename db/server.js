const http = require("http");
const student = require("..controllers/student");

http.createServer(function(req,res){
	switch(req.method){
		case "Get":
		
	}
}).listen(3000, function() {
	console.log("Start listening at 3000");
})