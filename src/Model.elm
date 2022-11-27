module Model exposing (..)

import Html exposing (b, div, p, text)
import Model.Date as Date
import Model.Event as Event exposing (Event)
import Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected)
import Model.Interval as Interval
import Model.PersonalDetails exposing (DetailWithName, PersonalDetails)
import Model.Repo exposing (Repo)


type alias Model =
    { personalDetails : PersonalDetails
    , events : List Event
    , selectedEventCategories : SelectedEventCategories
    , repos : List Repo
    }


academicEvents : List Event
academicEvents =
    [ { title = "Academic event 1"
      , interval = Interval.withDurationYears (Date.onlyYear 2020) 4
      , description = p [] [ text "I obtained ", b [] [ text "very" ], text " good grades." ]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Academic event 2"
      , interval = Interval.withDurationYears (Date.onlyYear 2020) 2
      , description = div [] []
      , category = Academic
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


workEvents : List Event
workEvents =
    [ { title = "Work event 1"
      , interval = Interval.withDurationMonths 2022 Date.Jun 3
      , description = text "DevOps Internship"
      , category = Work
      , url = Nothing
      , tags = []
      , important = True
      }
    
    ]


projectEvens : List Event
projectEvens =
    [ { title = "Personal project 1"
      , interval = Interval.oneYear 2021
      , description = text "An application for university management written in Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Personal project 2"
      , interval = Interval.oneYear 2022
      , description = text "Website for cinema management using Django"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Personal project 3"
      , interval = Interval.oneYear 2022
      , description = text "Simple web page using Elm"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


personalDetails : PersonalDetails
personalDetails =
    { name = "Tudor Branet"
    , intro = "I like computers"
    , contacts = [ DetailWithName "email" "branettudor22@gmail.com" ]
    , socials = [ DetailWithName "github" "https://github.com/Tudor2208" ]
    }


initModel : Model
initModel =
    { personalDetails = personalDetails
    , events = Event.sortByInterval <| academicEvents ++ workEvents ++ projectEvens
    , selectedEventCategories = allSelected
    , repos = []
    }
