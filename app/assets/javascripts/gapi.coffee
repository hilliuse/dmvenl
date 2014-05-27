window.signinCallback = (authResult) ->
  token = gapi.auth.getToken()
  accessToken = token.access_token
  if authResult["access_token"]
    accessUrl = "https://www.googleapis.com/oauth2/v2/userinfo/?access_token=" + accessToken
    $.ajax
      type: "GET"
      url: accessUrl
      async: false
      contentType: "application/json"
      dataType: "jsonp"
      success: (data) ->
        $("#user-data").append data.email + "<br>"
        return

      error: (e) ->
        console.log e
        return

    accessUrl = "https://www.googleapis.com/plus/v1/people/me?access_token=" + accessToken
    $.ajax
      type: "GET"
      url: accessUrl
      async: false
      contentType: "application/json"
      dataType: "jsonp"
      success: (data) ->
        originalImage = data.image.url
        imageUrl = originalImage.slice(0, -2)
        gplusImage = imageUrl + "128"

        #$('#fullname').val(data.displayName);
        #$('#gplus').val(data.id);
        $("#user-data").append data.id + "<br>"

        $('#user-data').append "<img src=" + data.image.url + "><br>";
        $("#user-data").append data.name.givenName + " " + data.name.familyName + "<br>"
        return


      #$('#user-data').append();
      #$('#user-data').append("<img src='" + gplusImage + "'><br><h4>" + data.displayName + "</h4>");
      error: (e) ->
        console.log e
        return

  else $("#user-data").html "<h4>Your request could not be completed at this time</h4>"  if authResult["error"]
  return


console.log "gapi loaded"
