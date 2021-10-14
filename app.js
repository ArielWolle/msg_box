const express = require('express')
const app = express()
const bodyParser = require('body-parser')
var Gpio = require('onoff').Gpio;
var fs = require('fs');
var request = require('request');
var ip="http://www.emilykogan.com";

app.use(bodyParser.text()); 

var pushButtonTest = new Gpio(17, 'in','rising');
var pushButtonTest2 = new Gpio(27, 'in','rising');
var pushButtonTest3 = new Gpio(22, 'in','rising');

pushButtonTest.watch(function(err, value)
{
	console.log(ip+':4000/test');
	if(err){
		console.error('There was an error',
	err);
	return;
	}
	request(ip+':4000/test', function (error, response, body){
	});
});
pushButtonTest2.watch(function(err, value)
{
	console.log(ip+':4000/test2');
	if(err){
		console.error('There was an error',
	err);
	return;
	}
	request(ip+':4000/test2', function (error, response, body){
	});
});
pushButtonTest3.watch(function(err, value)
{
	console.log(ip+':4000/test3');
	if(err){
		console.error('There was an error',
	err);
	return;
	}
	request(ip+':4000/test3', function (error, response, body){
    	})
});

app.get('/', (req, res) => {
	res.sendFile('/home/pi/node/myapp/index2.html');
})
app.get('/upload', (req, res) => {
    console.log('upload')
    request('http://localhost:8080/upload', function (error, response, body){
    })
    res.redirect('/');
})
app.get('/ip', (req, res) => {
	res.send(ip);
})
app.get('/save', (req, res) => {
        fs.writeFile('ip.txt', ip, (err) => {
    // throws an error, you could also catch it here
    if (err) throw err;

    // success case, the file was saved
    console.log('Lyric saved!');
    });
    res.redirect('/');
})
app.get('/test', (req, res) => { 
    console.log('test')
    request('http://localhost:8080/test', function (error, response, body){
    })
    res.redirect('/');
})
app.get('/test2', (req, res) => {
    console.log('test2')
    request('http://localhost:8080/test2', function (error, response, body){
    })
    res.redirect('/');
})
app.get('/test3', (req, res) => {
    console.log('test3')
    request('http://localhost:8080/test3', function (error, response, body){
    })
    res.redirect('/');
})
app.get('/stop_python', function(req, res) {
   const { spawn } = require('child_process');
   const pyProg4 = spawn('bash', ['/home/pi/node/myapp/command.sh']);
   res.redirect('/');
});
app.get('/clear', function(req, res) {
   const { spawn } = require('child_process');
   const pyProg4 = spawn('python', ['/home/pi/rpi_ws281x-master/python/clear.py']);
   res.redirect('/');
});


app.listen(4000, () => {
console.log('Application listening on port 4000!');
})
