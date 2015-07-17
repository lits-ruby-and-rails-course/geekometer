@Questions = React.createClass

  render: ->
    React.DOM.div
      className: 'questions'
      for question in @props.questions
        React.createElement Question, key: question.id, question: question
