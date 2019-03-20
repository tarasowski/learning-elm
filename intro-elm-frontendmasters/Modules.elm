-- Modules for Modularity
{-
   * A file in Elm can be 100 lines long
   * The primary line of module is module Name exposing ()
   * `exposing` part is to hide things, some of the implementation details only matter inside this module

   * Generally speaking the things in the module are built around particular type
   * On Pages usually it's a Module e.g. module Page.Article.Editor exposing (Model, Msg, ......)
   * And probably nobody else should mess with that Model

   * Another example with module Profile exposing (Profile, avatar, bio, decoder)
   * Profile is an opaque type, that do not expose it's internals and some helper functions

   * Another example is with the Author profile. It's built around the idea of 1 data structure
   * module Author exposing (Author(..), FollowedAuthor, UnfollowedAuthor, decoder, fetch, follow, unfollow, username,  followButton ....)
   * What that means you can decode, you can fetch an Author, you can follow or unfollow an Author. This is the entire API for working with an Author

   * Don't expose thing only to give access. You should better organize everything in one module around one data structure
   * Lower line count in JS is true, but not in Elm!
   * The better structure to start scaling Elm app, is to pick a module and start with it.
   * Just start adding stuff and build, at some point you decide to split it based on the data structure.
-}


module Main exposing (..)
