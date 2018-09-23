const faker = require('faker')
const elasticsearch = require('elasticsearch')

const INDEX_NAME = 'library'
const TYPE_NAME = 'article'

const genIDs = () => [...Array(10).keys()]
const genItem = () => ({
  title:   faker.random.words(5  /* number of words */),
  journal: faker.random.words(2),
  volume:  faker.random.number(5  /* upper limit */),
  number:  faker.random.number(20),
  year:    2007 + faker.random.number(10),
  link:    faker.internet.url(),
  body:    faker.lorem.paragraphs(),
  authors: [
    {
      firstname: faker.name.firstName(),
      lastname:  faker.name.lastName(),
      email:     faker.internet.email(),
    },
    {
      firstname: faker.name.firstName(),
      lastname:  faker.name.lastName(),
      email:     faker.internet.email(),
    },
  ],
})

function connES() {
  const conn = elasticsearch.Client({
    host: 'localhost:9200',
    log: 'error',
  })

  conn.ping().then(isUp => console.log(`[conn] cluster is ready: ${isUp}`))
  conn.cluster.health().then(stats => console.log(`[conn] status: ${stats.status}`))
  conn.info().then(infos => console.log(`[conn] name: ${infos.name}`))

  return conn
}

function initES(conn) {
  conn.indices.exists({ index: INDEX_NAME })
    .then(exists => exists ? 'index exists' : conn.indices.create({ index: INDEX_NAME }))
    .then(res => console.log(`created index: ${res}`))
    .catch(console.error)

  genIDs().forEach(i => conn.index({
    id: parseInt(i + 1, 10),
    index: INDEX_NAME,
    type: TYPE_NAME,
    body: genItem(),
  }).then(res => console.log(`doc ${i + 1} created: ${res.created}`)).catch(console.error))

  conn.count({ index: INDEX_NAME, type: TYPE_NAME }).then(res => console.log(`found ${res.count} documents`))
}

module.exports = { connES, initES, INDEX_NAME, TYPE_NAME }
