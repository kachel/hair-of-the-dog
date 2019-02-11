$(function() {
  $('a.load_comments').on('click', function(e) {
    e.preventDefault()

    $.get(this.href).done(function(json) {
      const commentsContainer = $('#comments')
      json
        .map(
          entry =>
            new HOTD.Comment({
              id: entry.id,
              content: entry.content,
              email: entry.user.email,
            }),
        )
        .forEach(comment => comment.insertInto(commentsContainer))
    })
  })
  $('#new_comment').submit(function(e) {
    e.preventDefault()

    const values = $(this).serialize()
    const url = this.action

    $.post(url, values).done(function(data) {
      const commentsContainer = $('#comments')
      const newComment = new HOTD.Comment({
        id: data.id,
        content: data.content,
        email: data.user.email,
      })

      newComment.insertInto(commentsContainer)
    })
  })
})
