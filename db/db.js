var sqlDb = require("mssql");

exports.load = function(sql) {
    return new Promise((resolve, reject) => {
        var conn = new sqlDb.ConnectionPool({
            user: "sa",
            password: "",
            server: "localhost\\SQLEXPRESS",
            database: "StudentManager.Database",
            port: 1433
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