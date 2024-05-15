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
    if(err) {
        console.error("Error with query:", err.stack);
    } else {
        recipes = res.rows;
    }
    db.end();
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
    console.log(req.body.email);
    res.render("home.ejs", {recipes: recipes});
});

app.listen(3000, () => {
    console.log(`Listening on port ${port}`);
});