const express = require('express');
const mysql = require('mysql');

const app = express();

// Connection Config
const dbConfig = {
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME
};

const connection = mysql.createConnection(dbConfig);

// Connect to MySQL
connection.connect(error => {
    if (error) throw error;
    console.log('Connected to the MySQL database!');
});

// Simple route
app.get('/users', (req, res) => {
    connection.query('SELECT * FROM users', (error, results) => {
        if (error) throw error;

        if (results.length === 0) {
            res.json({"users":[]})
        } else {
            res.json(results);
        }
    });
});

app.listen(8080, () => {
    console.log('App listening on port 8080');
});