import React from 'react'
import Link from 'next/link'
import Head from 'next/head'
import css from 'next/css'

export default () => (
  <div>
    <Head>
      <title>My page title</title>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hack/0.7.7/hack.css" />
    </Head>


    <div className="hack">
      <div className={style}>
        # Some Title<br />

        lorem epsum kenc bla blal vlbbla

        ## A list

        - item 1
        - item 2

        <hr />

        > A sublime and inspirational quotequote

        <button className="btn btn-primary">Primary</button>
        <button className="btn btn-primary btn-ghost">Ghost Button</button>

        <div className="alert alert-success">Success message</div>
      </div>
    </div>
  </div>
)

const style = css({
    background: 'white',
    ':hover': {
          background: 'gray'
    },
    '@media (max-width: 600px)': {
          background: 'blue'
    }
})
