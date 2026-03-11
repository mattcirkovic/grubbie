import express from "express";
import bodyParser from "body-parser";
import bcrypt from "bcrypt";
import dotenv from "dotenv";
import pg from "pg";

dotenv.config();

const app = express();
const port = 3000;

const db = new pg.Client({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: 5432,
});

db.connect();

//Middlewares
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    db.query("SELECT * FROM public.food_items", (err, results) => {
        if (err) {
            console.error("Error with query:", err.stack);
        } else {
            res.render("home.ejs", {food_items: results.rows});
        }
        db.end();
    });
});

app.get("/home", (req, res) => {
    db.query("SELECT * FROM public.food_items", (err, results) => {
        if (err) {
        console.error("Error with query:", err.stack);
        } else {
            food_items = results.rows;
        }
        db.end();
    });
    res.render("home.ejs", {food_items: food_items});
});

app.get("/login", (req, res) => {
    res.render("login.ejs");
});

app.post("/register", (req, res) => {
    db.query("SELECT * FROM users WHERE email = $1",[req.body.email], (err, qres) => {
        if(err) {
            console.error("Error with query:", err.stack);
        } else {
            if (qres.rowCount > 0) console.log("User already exists.");
            else bcrypt.hash(req.body.password, 3, (err, hash) => {
                db.query("INSERT INTO users(email, phash) VALUES ($1, $2)",[
                    req.body.email,
                    hash
                ]);
            })
        }
        //db.end();
    });

    res.render("home.ejs", {recipes: recipes});
});

app.listen(3000, () => {
    console.log(`Listening on port ${port}`);
});