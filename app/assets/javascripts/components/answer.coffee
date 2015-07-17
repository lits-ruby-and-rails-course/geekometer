@Answer = React.createClass
  render: ->
    React.DOM.p null,
      React.DOM.input
        type: 'radio'
        @props.answer.solution