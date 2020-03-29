import React from "react"
import axios from "axios"
import { Link } from "react-router-dom"

class Signup extends React.Component {
  constructor() {
    super()
    this.state = {
      username: "",
      password: ""
    }
    this.handlePassword = this.handlePassword.bind(this)
    this.handleUsername = this.handleUsername.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  handleUsername(event) {
    this.setState({ username: event.target.value })
  }
  handlePassword(event) {
    this.setState({ password: event.target.value })
  }
  handleSubmit(event) {
    event.preventDefault()
    axios.post("http://localhost:4000/api/users", {
      headers: { "Content-Type": "application/json" },
      user: {
        username: this.state.username,
        password: this.state.password
      }
    })
  }
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <div className="field">
          <label className="label">Username</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.username}
              onChange={this.handleUsername}
            />
          </div>
        </div>
        <div className="field">
          <label className="label">Password</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.password}
              onChange={this.handlePassword}
            />
          </div>
        </div>
        <button type="submit" value="Submit" className="button is-primary">
          Submit
        </button>
        <Link className="button is-info" to="/login">
          Login
        </Link>
      </form>
    )
  }
}
export default Signup
