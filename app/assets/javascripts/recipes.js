$(function () {
  $("a.load_comments").on("click", function (e) {
    e.preventDefault()
    // CLIENT SIDE AJAX model

    // low level interface
    // $.ajax({
    //   method: "GET",
    //   url: this.href
    // }).success(function (response) {
    //   $("div.comments").html(response)
    // })

    // high level interface for HTML response
    // $.get(this.href).success(function (response) {
    //   $("div.comments").html(response)
    // })

    // high level JSON response
    $.get(this.href).done(function (json) {
      // destructured assignment + punning
      json.map( {id, content, user} => new HOTDComment({id, content, email: user.email}) )
    })
  })
})
