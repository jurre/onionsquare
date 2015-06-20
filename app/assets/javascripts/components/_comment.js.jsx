var Comment = React.createClass({
  render: function () {
    return (
      <div className="comment">
        <img className="avatar" src={ this.props.user.gravatar_url } />
        <span className="comment-body">{ this.props.body }</span>
        <hr />
      </div>
    );
  }
});
