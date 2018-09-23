const express = require('express')
const kue = require('kue')
const queue = kue.createQueue()

const app = express()

queue.process('campaign', (job, done) => {
  console.log('job data:', job.data)
  setTimeout(() => job.progress(50, 100), 1000)
  setTimeout(() => done(null, { answer: 42 }), 5000)
})

app.post('/jobs/:id', (req, res) => {
  const jobQueue = queue.create('campaign', { foo: 'bar' })
                        .priority('high')
                        .attempts(5)
                        .backoff({ type: 'exponential' })
                        .save()
  jobQueue.on('job enqueue', (id, type) => console.log('job enqueued:', id, type))
  jobQueue.on('complete', (result) => console.log('job completed:', result))

  res.status(200).json({ queued: true, id: req.params.id })
})

app.listen(3000, () => console.log('Queue app listening on port 3000!'))
