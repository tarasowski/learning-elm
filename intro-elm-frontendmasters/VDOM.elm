-- Virtual DOM
{-
   * HTML (this HTML described the DOM tree below):

      <ul class ="lang">
        <li>Elm</li>
        <li>JS</li>
        </ul>

   * DOM:

        ul (root node)
        class="lang" (class attribute)
        li (child node of ul) --> text "Elm" (text is a child node of li)
        li (child node of ul) --> text "JS" (text is a child node of li)

   * ELM
   * But we don't have to use HTML to describe the DOM, we can use plain functions like as EML does:

    ul : attributes -> child -> Html
    ul [ class "lang" ] [
      li [] [text "Elm"]
      , li [] [text "JS"]
      ]

    * Originally when React was designed they used plain funciton calls to describe the DOM tree.
    * But at facebook they used a lot of php and templating engines. So in order to make React liked by other people he investend JSX.
    * JSX looks like f templating engine. The stupidity of people shows again that people need something similar they already know. Just wrap a new solution into old way of doing things. So it gets accepted!
-}


module Main exposing (..)
