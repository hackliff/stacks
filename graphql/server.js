const express = require('express')
const graphqlHTTP = require('express-graphql')
const { buildSchema } = require('graphql')

const isProduction = () => process.env.NODE_ENV === 'production'

// Construct a schema, using GraphQL schema language
const schema = buildSchema(`
  type Query {
    hello: String,
  }
`)

// The root provides a resolver function for each API endpoint
const root = {
  hello: () => 'Hello world!',
}

const app = express()

app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: !isProduction(),
  pretty: !isProduction()
}))

app.listen(4000)
console.log('Running a GraphQL API server at localhost:4000/graphql')
