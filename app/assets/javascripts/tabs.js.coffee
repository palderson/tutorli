window.loadTabs = (urls) ->
  $.each urls, (index, url) ->
    $.ajax
      url: url
      type: "get"
      dataType: "script"
