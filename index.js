var express =  require('express');
var app = express();

app.get('/', function (req, res) {
  var response = {
    environment: process.env.NODE_ENV,
    instance: process.env.INSTANCE_NAME
  };
    res.send(response);
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});

