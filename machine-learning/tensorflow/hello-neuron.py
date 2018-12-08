#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""
Dummy implementation of a single-neuron neural network
ref: https://www.oreilly.com/learning/hello-tensorflow
"""

import tensorflow as tf

N_ITERATION = 100


x = tf.constant(1.0, name='input')
w = tf.Variable(0.8, name='weight')
y = tf.mul(w, x, name='output')

# learning that 1 -> neuron -> 0
# correct output, our simple "traing set"
y_ = tf.constant(0.0, name='correct_value')
loss = tf.pow(y - y_, 2, name='loss')
train_step = tf.train.GradientDescentOptimizer(learning_rate=0.025).minimize(loss)

for value in [x, w, y, y_, loss]:
    tf.scalar_summary(value.op.name, value)

summaries = tf.merge_all_summaries()

sess = tf.Session()
# dump graf state to disk
# tensorboard can print it with `tensorboard --logdir=log_simple_stat`
summary_writer = tf.train.SummaryWriter('log_simple_stat')

sess.run(tf.initialize_all_variables())

for i in range(N_ITERATION):
    print('[ step {} ] output = {}'.format(i, sess.run(y)))
    summary_writer.add_summary(sess.run(summaries), i)
    sess.run(train_step)

print('\nfinal fitting: {}'.format(sess.run(y)))
