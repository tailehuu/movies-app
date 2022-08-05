const express = require('express')
const axios = require('axios')

const app = express()

app.set('view engine', 'ejs')
app.get('/', (req, res) => {
  axios.get('http://localhost:3000/movies')
    .then(function (response) {
      res.render('index', { movies: response.data.models })
    })
    .catch(function (error) {
      console.log(error);
    });
})

app.listen(3001)
