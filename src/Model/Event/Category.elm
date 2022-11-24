module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-}
type SelectedEventCategories
    = SelectedEventCategories {academic: Bool, work: Bool, project: Bool, award: Bool}


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected = SelectedEventCategories {academic = True, work = True, project = True, award = True}
     

{-| Returns an instance of `SelectedEventCategories` with no categories selected

-- isEventCategorySelected Academic noneSelected --> False

-}
noneSelected : SelectedEventCategories
noneSelected = SelectedEventCategories {academic = False, work = False, project = False, award = False}
    -- TODOCompleteThisType
    -- Debug.todo "Implement Model.Event.Category.noneSelected"

{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category (SelectedEventCategories {academic, work, project, award}) =
    case category of 
        Academic -> academic
        Work -> work
        Project -> project
        Award -> award

{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value (SelectedEventCategories {academic, work, project, award}) =
    case category of
        Academic -> SelectedEventCategories {academic = value, work = work, project = project, award = award}
        Work -> SelectedEventCategories {academic = academic, work = value, project = project, award = award}
        Project -> SelectedEventCategories {academic = academic, work = work, project = value, award = award}
        Award -> SelectedEventCategories {academic = academic, work = work, project = project, award = value}

checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
    div [] [
        checkbox "Academic" (isEventCategorySelected Academic model) Academic,
        checkbox "Work" (isEventCategorySelected Work model) Work,
        checkbox "Project" (isEventCategorySelected Project model) Project,
        checkbox "Award" (isEventCategorySelected Award model) Award
    ]
    
