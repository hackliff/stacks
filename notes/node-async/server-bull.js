const express = require('express')
const async = require('async')
const Queue = require('bull')

const app = express()
const jobQueue = Queue('storing campaign', 6379, '0.0.0.0')

jobQueue.process((job, done) => {
  console.log('job data:', job.data)
  setTimeout(() => job.progress(50), 1000)
  setTimeout(() => done(null, { answer: 42 }), 5000)
})

jobQueue.on('ready', () => console.log('job queue is ready'))
jobQueue.on('active', (job, jobPriomise) => console.log('job is active'))
jobQueue.on('progress', (job, progress) => console.log('job is progressing:', progress))
jobQueue.on('completed', (job, result) => console.log('job is done:', result))

app.post('/jobs/:id', (req, res) => {
  [{ foo: 'bar' }, { hello: 'world' }].forEach(data => {
    console.log('queuing job:', data)
    jobQueue.add(data)
  })

  jobQueue.count().then((count) => res.status(200).json({ count }))
  //res.status(200).json({ queued: true, id: req.params.id })
})

app.get('/jobs', (req, res) => {
  jobQueue.count().then((count) => res.status(200).json({ count }))
})

app.listen(3000, () => console.log('Example app listening on port 3000!'))
