var Comment = React.createClass({
  render: function () {
    return (
      <div className="comment">
        <img src={ this.props.user.gravatar_url } />
        <p>{ this.props.body }</p>
      </div>
    );
  }
});
