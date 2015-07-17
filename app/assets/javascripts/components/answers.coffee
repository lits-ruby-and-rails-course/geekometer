@Answers = React.createClass
  render: ->
    React.DOM.div
      className: 'answers'
      React.DOM.p null,
        for answer in @props.answers
          React.createElement Answer, key: answer.id, answer: answer