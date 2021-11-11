//use path module
const path = require('path');
//use express module
const express = require('express');
//use hbs view engine
const hbs = require('hbs');
//use bodyParser middleware
const bodyParser = require('body-parser');
//use mysql database
const mysql = require('mysql2');
const app = express();
 
//konfigurasi koneksi
const conn = mysql.createConnection({
  host: "voting.cmjjmqqbgu6k.ap-southeast-1.rds.amazonaws.com",
  user: "andik",
  password: "AndikVoting123#",
  database: "voting",
  multipleStatements: true,
});
 
//connect ke database
conn.connect((err) =>{
  if(err) throw err;
  console.log('Mysql Connected...');
});
 
//set views file
app.set('views',path.join(__dirname,'views'));
//set view engine
app.set('view engine', 'hbs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
//set folder public sebagai static folder untuk static file
app.use('/assets',express.static(__dirname + '/public'));
 
//route untuk start
app.get('/',(req, res) => {
    res.render('index',{});
});

//route untuk search token
app.post('/search',(req, res) => {
    let sql = "SELECT idToken, used, token FROM token WHERE token='"+req.body.token+"'";
    let query = conn.query(sql, (err, results) => {
      if(err) {
        res.redirect("used");
      };

      if (results[0] == undefined) {
        res.redirect("false");
      } else if (results[0]["used"] === 0 ) {
        res.redirect("used");
      } else {
        res.redirect(
          "vote?id=" + results[0]["used"] + "&idToken=" + results[0]["idToken"]
        );
      }
    });
  });

//route untuk get vote
app.get('/vote',(req, res) => {
    if (req.query.id === '1') {
        res.render('vote',{
          idToken: req.query.idToken
        });
    } else {
        res.redirect("false");
    }
});

//route untuk post vote
app.post('/kandidat',(req, res) => {
  let data = {idToken: req.body.idToken, idKandidat: req.body.kandidat};
  let sql = "INSERT INTO pemilih (idToken, idKandidat) VALUES " + "('"+req.body.idToken+"',"+"'"+req.body.kandidat +"'); UPDATE token SET used=0 WHERE idToken='"+req.body.idToken+"'";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
      res.redirect('result');
  });
});

//route untuk result
app.get('/result',(req, res) => {
  let arr = [];
  let sql =
    "SELECT kandidat FROM `kandidat` ORDER BY `kandidat`.`idKandidat` ASC; SELECT COUNT(idKandidat) FROM pemilih WHERE idKandidat = 'a'; SELECT COUNT(idKandidat) FROM pemilih WHERE idKandidat = 'b'; SELECT COUNT(idKandidat) FROM pemilih WHERE idKandidat = 'c'; SELECT COUNT(idKandidat) FROM pemilih WHERE idKandidat = 'd'; SELECT COUNT(used) FROM token WHERE used=1; SELECT COUNT(used) FROM token WHERE used=0";
  let query = conn.query(sql, [0,1,2,3,4,5,6], (err, results) => {
    if(err) throw err;
    arr.push(results[1][0]);
    arr.push(results[2][0]);
    arr.push(results[3][0]);
    arr.push(results[4][0]);
    res.render("result", {
      results: results[0],
      perolehan: arr,
      no: results[5][0]["COUNT(used)"],
      yes: results[6][0]["COUNT(used)"],
    });
  });
});

//route untuk used
app.get('/used',(req, res) => {
    res.render('used',{});
});

//route untuk used
app.get('/false',(req, res) => {
    res.render('false',{});
});

const PORT = process.env.PORT || 8000;

//server listening
app.listen(PORT, () => {
  console.log('Server is running at port 8000');
});