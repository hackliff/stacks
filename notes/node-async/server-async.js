const express = require('express')
const async = require('async')

const app = express()
const queue = async.queue((job, done) => {
  console.log('job data:', job)
  setTimeout(() => done(), 5000)
})

queue.drain = function() {
  console.log('all items have been processed');
}

app.post('/jobs/:id', (req, res) => {
  queue.push([{ foo: 'bar' }, { hello: 'world' }], (err) => console.log('error caught:', err))

  res.status(200).json({ queued: true, id: req.params.id })
})

app.listen(3000, () => console.log('Queue app listening on port 3000!'))
