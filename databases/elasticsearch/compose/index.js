const elasticsearch = require('elasticsearch')

const conn = new elasticsearch.Client({ hosts: process.env.ES_HOSTS.split(',') })

const query = { match: { constituencyname: 'Harwich' } }
conn.search({
  index: 'gov',
  type: 'constituencies',
  body: { query }
}, (err, res) => {
  console.log("--- Response ---")
  console.log(res)

  console.log("--- Hits ---")
  res.hits.hits.forEach(hit => console.log(hit))
})
