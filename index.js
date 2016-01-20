var express =  require('express');
var app = express();

app.get('/', function (req, res) {
    res.send('Environment: ' + process.env.NODE_ENV || 'not set');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});

