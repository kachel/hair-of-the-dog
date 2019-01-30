// IIFE that hides the root level variables

~function () {

  const comments = []

  // Assign Comments constructor function to our global namespace
  HOTD.Comment = class Comment {
    // To create a JS comment object call this constructor
    //
    //     new HOTD.Comment({id: 123, content: "hello", user: "florb"})

    constructor(obj) {
      this.id = obj.id
      this.content = obj.content
      this.email = obj.email
      // Create a cache of the comment instances
      comments[this.id] = this
    }

    insertInto($container) {

      $container.append(`<li> ${this.email} says: ${this.content} </li>`)
    }
  }
}()
