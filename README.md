# notemeister5000

== API for Notemeister 5000

* GET /api/notes

  returns all notes in the API

* POST /api/notes {"title" : "My created post", "body" : "My created body", "tags" : "tags, separated, by, commas", "api_token":"<your-token-here"}

  adds a new note with the associated title, body and tags.  Tags should be in a string separated by commas.  No symbols are spaces are allowed.  Spaces and symbols will be stripped out.  Only letters and numbers can be used. All tags will be downcased.  The api_token is optional if you want the note assigned to your account.

* GET /api/notes/tag/:tag

  returns all notes that are associated with that tag.  :tag should be the name of the tag in all lowercase letters.

* POST /api/user/create  {"email" : "whatever@example.com"}

  creates a new user and returns the email and api_token for that user.  Will return error if user exists already.
