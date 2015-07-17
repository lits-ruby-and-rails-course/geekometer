@Quiz = React.createClass
  getInitialState: ->
    questions: @props.questions

  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'

        React.DOM.div
          className: 'col-md-6'
          React.DOM.h2
            className: 'quiz title'
            'Quiz:'
          React.createElement Questions, questions: @state.questions

        React.DOM.div
          className: 'col-md-6'
          React.createElement IsGeek