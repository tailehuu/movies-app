const express = require('express')
const app = express()

app.set('view engine', 'ejs')

app.get('/', (req, res) => {
  // TODO: call to server to fetch movies here
  const movies = [
    {
      "id": 38,
      "title": "Lorem ipsum dolor sit amet",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor rutrum lorem nec efficitur. Sed auctor sodales interdum. Duis dignissim nisi non lorem feugiat molestie. Etiam dapibus sapien a tellus hendrerit, at sodales augue scelerisque. Pellentesque faucibus id leo eu ornare.",
      "link": "https://www.youtube.com/watch?v=_yYBRqt1xU0",
      "number_votes_up": 123,
      "number_votes_down": 0,
      "shared_by": "tai.le@local.com",
      "created_at": "1607110465663"
    },
    {
      "id": 38,
      "title": "Sed in diam in urna hendrerit sollicitudin et non augue",
      "description": "Sed in diam in urna hendrerit sollicitudin et non augue. Nunc dignissim felis vel orci finibus accumsan. Duis id dui nisl. Ut imperdiet diam id erat pretium, vel feugiat mi porttitor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus mi arcu, euismod malesuada iaculis id, aliquam et enim.",
      "link": "https://www.youtube.com/watch?v=_yYBRqt1xU022",
      "number_votes_up": 20,
      "number_votes_down": 1,
      "shared_by": "tai.le@local.com",
      "created_at": "1659673217"
    }
  ]
  res.render('index', { movies: movies })
})

app.listen(3001)
