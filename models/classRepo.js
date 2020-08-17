const db = require('../db/db');
//manager
exports.loadAllClass = () => {
	const sql=`select Class.ClassId, Class.ClassName,Room.RoomId, Room.RoomName,PersonalInfo.PersonalInfoId, PersonalInfo.LastName, PersonalInfo.MiddleName, PersonalInfo.FirstName, e.SumStudent, e.AcademicYear from class left join homeroom on Class.ClassId = HomeRoom.ClassId
				left join PersonalInfo on PersonalInfo.PersonalInfoId = HomeRoom.TeacherId left join
				(select ClassId, AcademicYear, count(*) as SumStudent from EnrolledClass group by ClassId, AcademicYear) as e on e.ClassId = Class.ClassId join Room on CLass.RoomId = Room.RoomId`;
	return db.load(sql);
}
exports.listStudentInClass = (ClassId, Year)=>{
	let sql = `select PersonalInfo.*, EnrolledClass.AcademicYear from EnrolledClass left join Class on EnrolledClass.ClassId = Class.ClassId join Student on Student.StudentId = EnrolledClass.StudentId join PersonalInfo on PersonalInfo.PersonalInfoId = Student.StudentId `
	if(ClassId != null)
	{
		sql = sql + ` where EnrolledClass.ClassId = '${ClassId}'`;
		if(Year != null)
			sql = sql + `and EnrolledClass.AcademicYear = ${Year}`;
	}
	return db.load(sql);	
}
//teacher
exports.listClass = (TeacherId, sem, year) => {
	let sql= `select distinct Schedule.ClassId, e.SumStudent, CONCAT(PersonalInfo.LastName, ' ', PersonalInfo.MiddleName, ' ' ,PersonalInfo.FirstName) as 'HomeroomTeacherName' from Schedule join (select EnrolledClass.ClassId, EnrolledClass.AcademicYear, count(*) as SumStudent from EnrolledClass join Student on EnrolledClass.StudentId = Student.StudentId group by EnrolledClass.ClassId, EnrolledClass.AcademicYear) as e on Schedule.ClassId = e.ClassId
	join HomeRoom on HomeRoom.ClassId = Schedule.ClassId
	join PersonalInfo on PersonalInfo.PersonalInfoId = HomeRoom.TeacherId `
	if(TeacherId != null && sem != null && year != null)
		sql = sql + `where Schedule.TeacherId = '${TeacherId}' and Schedule.Semester = ${sem} and Schedule.AcademicYear = ${year}`;
	return db.load(sql);
}
exports.singleClass = (ClassId) =>{
	const sql = `select * from Class where ClassId = '${ClassId}'`;
	return db.load(sql);
}
exports.listRoom = () =>{
	const sql = `select Room.*, Class.ClassId from Room left join Class on Class.RoomId = Room.RoomId`;
	return db.load(sql);	
}
exports.add = (cl) =>{
	const sql = `insert into class(ClassId, ClassName, RoomId) values('${cl.ClassId}', '${cl.ClassId}', '${cl.RoomId}');
				insert into HomeRoom(ClassId, TeacherId, AcademicYear) values('${cl.ClassId}', '${cl.TeacherId}', ${cl.AcademicYear})`;
	return db.load(sql);
}
exports.update = (cl) =>{
	const sql = `update class set RoomId = '${cl.RoomId}' where ClassId = '${cl.ClassId}' and '${cl.RoomId}';`;
	return db.load(sql);	
}
