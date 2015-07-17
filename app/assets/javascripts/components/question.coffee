@Question = React.createClass

  render: ->
    React.DOM.div
      className: 'question'
      React.DOM.h2 null,
        @props.question.condition
      React.createElement Answers, answers: @props.question.answers
