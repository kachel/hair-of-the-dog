~function () {

  const allComments = []

  class HOTDComment {
    // To create a JS comment object call this constructor
    //
    //     new HOTDComment({id: 123, content: "hello", user: "florb"})

    constructor(obj) {
      this.id = obj.id
      this.content = obj.content
      this.email = obj.email
    }

    insertInto($container) {

      $container.append(`<li> ${this.email} says: ${this.content} </li>`)
    }
  }
  
}
