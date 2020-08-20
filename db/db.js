var sqlDb = require("mssql");

exports.load = function(sql) {
    return new Promise((resolve, reject) => {
        var conn = new sqlDb.ConnectionPool({
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            server: "localhost\\"+process.env.SQLSERVER_NAME,
            database: process.env.DB_NAME,
            port: parseInt(process.env.DB_PORT)
        });
        conn.connect()
        .then(function() {
            var req = new sqlDb.Request(conn);
            req.query(sql, (error, rows) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(rows);
                }
            });
        })
        .catch()
    })
};