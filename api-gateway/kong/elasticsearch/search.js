const eslib = require('./eslib')

conn = eslib.connES()
//eslib.initES(conn)

conn.search({
  index: eslib.INDEX_NAME,
  type: eslib.TYPE_NAME,
  body: {
    query: {
      match_all: {},
      //match: { year: 2015 },
      //match: { title: { query: 'paymetn', fuzziness: 2 } },
      //regexp: { link: '.+org' },
    },
    aggregations: {
      min_year: {
        min: {field: 'year'}
      },
    },
  },
}).then(res => {
  console.log(`found ${res.hits.total} items in ${res.took}ms`)
  console.log(`minimal year found: ${res.aggregations.min_year.value}`)
  res.hits.hits.forEach(article => console.log(`\t- title: ${article._source.title}`))
}).catch(console.error)
