import { name } from "ejs";
import express from "express";
import pg from "pg";
import bodyParser from "body-parser";
import bcrypt from "bcrypt";

const app = express();
const port = 3000;

let recipes = {
    name: "name",
    servings: -1,
};

const db = new pg.Client({
    user: "postgres",
    host: "localhost",
    database: "grubbie_db",
    password: "AlexBarry1",
    port: 5432,
});

db.connect();

db.query("SELECT * FROM recipes", (err, res) => {
    if (err) {
        console.error("Error with query:", err.stack);
    } else {
        recipes = res.rows;
    }
    //db.end();
});

//Middlewares
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.render("home.ejs", {recipes: recipes});
});

app.get("/home", (req, res) => {
    res.render("home.ejs", {recipes: recipes});
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