var mysql= require('mysql');
var express= require('express');
var bodyparser= require('body-parser');
var encoder = bodyparser.urlencoded();
var app = express();
var connection= mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"root",
});
connection.connect(function(err){
    if (err) throw err;
   else console.log("connected")
   // con.query("create database test",function(err,result){
      //  if(err) throw err;
        //console.log("database connected");
    
});
app.get("/",function(req,res){
    res.sendFile(__dirname + "/index.html");
}) 
 app.post("/",encoder, function(req,res){
var user_name = req.body.username;
var password = req.body.password;
     connection.query("select * from loginuser where user_name = ? and user_pass = ?",[username,password] ,function(err,result,fields){
         if (result.length>0){
             res.redirect("/welcome");
         }
             else{
                 res.redirect("/");
             
         }
         res.end();
     })
 })
 //when login in successfull
app.get("/",function(req,res){
 res.sendFile(__dirname + "/welcome.html");
})

app.listen(4501);
