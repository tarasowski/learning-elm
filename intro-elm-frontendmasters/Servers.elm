-- Talking to Servers
{-
   * Tuples
   * serve the same purpose as records
   * except with field positions instead of field names, they use fild positions
    * x = Tuple.first (5, 7)
    * destructuring syntax: (name, x, y) = ("foo", 5, 7)
      * here (name, x, y) refers to the position
    * x = { x = 5, y = 7 }.x this is how we would get the x out of the record
    * {name, x, y} = {name = "foo", x = 5 , y = 7}
      * here {name, x, y} refers to the same name that should be available in the record
    * tuples have a 3 elements maximum!!!

   * Records and tuples are nothing more than group of values that travel together
   * animate {name ="foo", x = 1, y = 3} or animate ("foo", 1, 3) or animate "foo" 1 3 --> we are doing the same things in 3 cases.

   * Function guarantees:
      * Same value, same return (referential transparency)
      * Elm has no Math.random() but has Random.generate

   * Randomness
   * Commands
   * Http
-}


module Main exposing (request)

-- Randomness
-- What is a command
-- Msg is the fundamental job is how the Elm runtime talks to update. The update function updates the model. When the model gets updated the view gets rendered.
-- The only thing that it has to say to update. Here is some user interaction has happened. User clicked a thing, user has typed into a thing.
-- Commands introduce a second thing that the elm runtime can say to update. It essentially goes from update to the Elm runtime then the Elm runtime sends a message to update.
-- Where the user interaction case coming from view, view says here is my message that I want the runtime send to update to response to this user input.
-- Where commands come from update. The commands are saying: I want you the runtime to run this command and when you are done give me back this message.
-- A command is a description of something you want done. It's not a side-effect, when you instantiate a command nothing happens. It basically a description: "dear runtime, do this and tell me what has happended"
-- Now the update returns a tuple of the model and optionally some commands to run. The runtime will update the Model but also look at the command that comes from update.
-- We can use commands to run side-effects such as generate random numbers, or http requests.
-- Dear runtime go and produce the random greeting for me, but when you done give me the greeting you have picked.
-- Commands isolate the side-effects inside the runtime. It's a runtime's job to do all that stuff. update function has always referntial transparency, but the runtime runs the side-effects (messaging pattern)
-- The cycle: view sends a Msg to the runtime, the runtime sends a message to update the update updates a model, view gets re-rendered. But update can also send a command to runtime to run side-effects. The runtime then sends the result back to the update, the update function updates the model etc.
{-

   update -------- Model ------- view
   |     .                         |
   Msg    Cmd Msg               Html Msg
   |       .                       |
   |         .                     |
   ------------Elm Runtime---------
-}
--
--
{-
   Browser.sandbox
   update: Msg -> Model -> Model

   Browser.element
   update : Msg -> Model -> (Model, Cmd Msg)
-}
-- Instead of doing side-effects Elm does **managed-effects**: It means any side-effects have to be done through commands. The runtime is going to perform side-effects. Any Elm function you call, is going to be pure function.
-- All side-effects are isolated to the runtime
-- getString : String -> Request String (takes url and returns a container Request) than we take the Request ------ Http.send ---------> Cmd (Http.send takes a request, runs the request and returns a Cmd)
-- it translates failure into a Msg and it translates success into a Msg
{-
      Http.send
        (\result -> CompletedLoadFeed result)
          Http.getString "/feed?tag=happiness")

    cmd : Cmd Msg
     cmd = Http.getString "/feed?tag=happiness" -- is the request that i want to send, the runtime sends the request to the server
       |> Http.send CompletedLoadFeed -- here is the message that should be sent back to update

   Http.get articlesDecoser url
     case msg of
       CompletedLoadFeed (Ok articles) ->
       CompletedLoadFeed (Err error) ->
-}


request =
    Debug.todo "I will come back to it later"



-- It's kind of a todo for myself that I need to fix before it goes into production
-- it's going to compile for dev but if we run elm make --otpimize it's not going to compile!!
