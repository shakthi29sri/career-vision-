const express = require("express");
const app = express();
app.use(express.static('public'));
app.set('view engine','ejs');
 
 app.get('/interest',(req,res)=>{
    res.render("interest");
});
app.get('/',(req,res)=>{
    res.render("index");
});
app.get('/login',(req,res)=>{
    res.render("login");
});
 

app.listen(3100);
