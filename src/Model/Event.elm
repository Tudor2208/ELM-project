module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)

type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
        List.sortWith (\a b -> Interval.compare a.interval b.interval) events
    

view : Event -> Html Never
view event =
     if event.important == False then
        div [class "event"] [
            h2[class "event-title"][text event.title],
            div[class "event-description"] [event.description],
            div[class "event-category"][categoryView event.category],

            case event.url of
                Just str -> div[class "event-url"] [text str]
                Nothing -> div[class "event-url"] [],

            div [class "event-interval"] [Interval.view event.interval]       
     ]

     else
        div [class "event", class "event-important"] [
                h2[class "event-title"][text event.title],
                div[class "event-description"] [event.description],
                div[class "event-category"][categoryView event.category],

                case event.url of
                    Just str -> div[class "event-url"] [text str]
                    Nothing -> div[class "event-url"] []   
        ]
    
