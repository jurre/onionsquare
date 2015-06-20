var CommentBox = React.createClass({
  getInitialState: function () {
    return this.props.product;
  },

  componentDidMount: function () {
    var self = this;
    var pusher = new Pusher('690cf7317835f06d3791');
    var channel = pusher.subscribe(this.state.pusher_channel);
    channel.bind('comment', function(data) {
      self.setState({ comments: data });
    });
  },

  _postComment: function (e) {
    e.preventDefault();
    var self = this;
    var body = this.refs.body.getDOMNode().value;

    $.ajax({
      data: {
        comment: {
          body: body
        }
      },
      url: this.state.endpoint,
      type: "POST",
      success: function (data) {
        self.setState({ comments: data });
      }
    });

    this.refs.body.getDOMNode().value = '';
  },

  _renderComments: function () {
    return this.state.comments.map(function (comment) {
      return <Comment user={ comment.user }
                      body={ comment.body }
                      key={ comment.id } />
    });
  },

  render: function () {
    return (
      <div className='comment-box'>
        <img src={ this.state.gravatar_url } />
        <form onSubmit={ this._postComment }>
          <input ref='body' type='text' placeholder='New comment' />
          <input type='submit' value='Post' />
        </form>
        { this._renderComments() }
      </div>
    );
  }
});
