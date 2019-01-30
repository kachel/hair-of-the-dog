$(function() {
    $("a.load_comments").on("click", function (e) {

      e.preventDefault()

      $.get(this.href).done(function (json) {
        const commentsContainer = $("#comments")
        // destructured assignment + punning
        json
          // .map( ({id, content, user} => new HOTDComment({id, content, email: user.email})) )
          .map( entry => new HOTDComment({ id: entry.id, content: entry.content, email: entry.user.email }) )
          .forEach( comment => comment.insertInto(commentsContainer) )

    // high level JSON response
    $.get(this.href).done(function (json) {
      // destructured assignment + punning
      json.map( {id, content, user} => new HOTDComment({id, content, email: user.email}) )
    })
  })
})
