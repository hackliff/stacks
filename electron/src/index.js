const React = require('react')
const ReactDOM = require('react-dom')

class MyComponent extends React.Component {
  render() {
    return(
      <div className="greeting">
        <h1>Hello World!</h1>
        <p>
          We are using node {process.versions.node},
          Chromium {process.versions.chrome},
          and Electron {process.versions.electron}.
        </p>
      </div>
    )
  }
}

ReactDOM.render(<MyComponent />, document.getElementById('root'))
