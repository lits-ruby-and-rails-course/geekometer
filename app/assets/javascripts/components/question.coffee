@Question = React.createClass

  render: ->
    React.DOM.div
      className: 'question'
      React.DOM.p null,
        @props.question.condition
#      React.DOM.p null,
