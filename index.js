import express from "express";
const app = express();
const port = 3000;

app.use(express.static('public'));

app.get("/", (req, res) => {
    res.render("home.ejs");
});

app.get("/login", (req, res) => {
    res.render("login.ejs");
});

app.listen(3000, () => {
    console.log(`Listening on port ${port}`);
});