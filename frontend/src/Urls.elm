module Urls exposing (..)

import Debug
import Navigation
import String
import UrlParser exposing (Parser, (</>), map, int, oneOf, s, string)


{-| Main type representing current url/page
-}
type Page
    = Home
    | Project String
    | NewProject
    | Jobset String String


pageParser : Parser (Page -> a) a
pageParser =
    oneOf
        [ map Home (s "")
        , map Project (s "project" </> string)
        , map NewProject (s "create-project")
        , map Jobset (s "jobset" </> string </> string)
        ]


pageToURL : Page -> String
pageToURL page =
    case page of
        Home ->
            "/"

        Project name ->
            "/project/" ++ name

        NewProject ->
            "/create-project"

        Jobset project jobset ->
            "/jobset/" ++ project ++ "/" ++ jobset


pageToTitle : Page -> String
pageToTitle page =
    case page of
        Home ->
            "Projects"

        Project name ->
            "Project " ++ name

        NewProject ->
            "New Project"

        Jobset project jobset ->
            "Jobset " ++ jobset ++ " of project " ++ project
