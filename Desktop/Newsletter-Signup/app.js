const express = require("express");
const bodyParser  = require("body-parser")
const request = require("request");
const https = require("https");

const app = express();

app.use(express.static("public"));

app.use(bodyParser.urlencoded({
  extended: true
}));


app.get('/', (req, res) => {
  res.sendFile(__dirname + "/signup.html")
});

app.post('/', (req, res) => {
  const userFirstName = req.body.firstName;
  const userLastName = req.body.lastName;
  const userEmail = req.body.email;

  const data = {
    members: [
      {
        email_address: userEmail,
        status: "subscribed",
        merge_fields: {
          FNAME: userFirstName,
          LNAME: userLastName
        }
      }
    ]
  }
const jsonData = JSON.stringify(data);
const url = "https://us1.api.mailchimp.com/3.0/lists/74ba912796";

const options = {
  method: "POST",
  auth: "damoL:09f35bd9b39293602d2cb7efab249cd0-us1"
}

const request = https.request(url, options, function(response){
if (response.statusCode === 200){
  res.sendFile(__dirname + "/success.html");
} else {
  res.sendFile(__dirname + "/failure.html");
}

  response.on("data", function(data){
    console.log(JSON.parse(data));
  })
})
request.write(jsonData);
request.end();
});

app.post('/failure', (req, res) => {
  res.redirect("/");
});

app.post('/success', (req, res) => {
  res.redirect("/");
});

app.listen(process.env.PORT || 3000, function(){
console.log("server is running")
});




// chimp api
// 09f35bd9b39293602d2cb7efab249cd0-us1

// list ID.
// 74ba912796
