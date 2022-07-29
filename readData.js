require('dotenv').config()
const mysql = require('mysql');
const setMetadata = require('./dataCatalogInsert');

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE
});

connection.connect();

const base = {
    projectId: process.env.PROJECT_ID,
    dataset: process.env.DATASET
};
connection.query(`select table_name, column_description 
FROM mcp_db.control_columns t1
JOIN mcp_db.control_tables t2 on t1.table_id = t2.table_id 
WHERE t1.column_description like '%NOM=%'`
    , (error, results, fields) => {
        if (error) throw error;
        try {
            results.forEach((row) => {
                const fields = {};
                row.column_description.split(";").map((value) => {
                    data = value.split("=")
                    fields[data[0]] = {
                        stringValue: data[1]
                    };
                });
                setMetadata({
                    ...base,
                    table: row.table_name,
                    fields
                })
            });
        } catch (ex) {
            console.log(ex);
        }
    });