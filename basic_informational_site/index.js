var express = require('express');
var fs = require('fs');
http = require('http');
var dt = require('./datetime');

var app = express()
const hostname = '127.0.0.1';
const port = 3000;

app.get('/', function (req, res) {
  res.send('index');
})

app.get('/about', function (req, res) {
  res.send('about');
})

app.get('/contact-me', function (req, res) {
  res.send('contact-me');
})

app.use(function (req, res, next) {
  res.send('404')
})

app.listen(port, () => {
  console.log(` ${dt.myDateTime()}: Server running at http://${hostname}:${port}/`);
});
