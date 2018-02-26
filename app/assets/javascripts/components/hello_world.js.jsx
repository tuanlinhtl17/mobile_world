// var HelloWorld = React.createClass({
//   propTypes: {
//     greeting: React.PropTypes.string
//   },

//   render: function() {
//     return (
//       <div>
//         <div className="text-center">Greeting: {this.props.greeting}</div>
//         <button className="btn btn-primary">aa</button>
//       </div>
//     );
//   }
// });

// var Hello = React.createClass({
//   propTypes: {
//     greeting: React.PropTypes.string
//   },

//   render: function() {
//     return (
//       <div>
//         <div className="text-center">Greeting: {this.props.greeting}</div>
//       </div>
//     );
//   }
// });

// class HelloWorld extends React.Component {
//   static propTypes = {
//     name: PropTypes.string.isRequired
//   };

//   constructor(props) {
//     super(props);
//     this.state = { name: this.props.name };
//   }

//   updateName = function(name) {
//     this.setState({ name });
//   };

//   render() {
//     return (
//       <div className="text-center">
//         <h1>Hello World</h1>
//         <h3>
//           Hello, {this.state.name}!
//         </h3>
//         <hr />
//         <form >
//           <label htmlFor="name">
//             Say hello to:
//           </label>
//           <input
//             id="name"
//             type="text"
//             value={this.state.name}
//             onChange={(e) => this.updateName(e.target.value)}
//           />
//         </form>
//       </div>
//     );
//   }
// }

var HelloWorld = React.createClass({
  propTypes: {
    title: React.PropTypes.string.isRequired
  },

  getInitialState() {
    return {
      title: this.props.title
    };
  },

  updateName(title) {
    this.setState({title: title});
  },

  render() {
    <div className="text-center">
      <h1>Hello World</h1>
      <h3>
        Hello, {this.state.title}!
      </h3>
      <hr />
      <form >
        <label htmlFor="title">
          Say hello to:
        </label>
        <input
          id="title"
          type="text"
          value={this.state.title}
          onChange={(e) => this.updateName(e.target.value)}
        />
      </form>
    </div>
  }
});