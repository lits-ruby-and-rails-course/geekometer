@Quiz = React.createClass
  getInitialState: ->
    didFetchData: false
    questions: []

  componentDidMount: ->
    @fetchPeople({})

  fetchPeople: (data)->
    $.ajax
      url: '/pages/start.json'
      dataType: 'json'
      data: data
    .done @fetchDataDone
    .fail @fetchDataFail

  fetchDataDone: (data, textStatus, jqXHR) ->
    @setState
      didFetchData: true
      questions: data

  fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'

        React.DOM.div
          className: 'col-md-6'
          React.DOM.h1
            className: 'quiz title'
            'Quiz:'
          React.createElement Questions, questions: @state.questions

        React.DOM.div
          className: 'col-md-6'
          React.createElement IsGeek