module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }

createContactListItem: DetailWithName -> Html msg
createContactListItem detailWithName =
    let
        {name, detail} = detailWithName
    in
        li [class "contact-detail"] [text (name ++ ": " ++ detail)]    

createSocialListItem: DetailWithName -> Html msg
createSocialListItem detailWithName =
    let
        {name, detail} = detailWithName
    in
        li [class "social-link"] [ text (name ++ ": "), a [ href detail ] [ text detail ] ]

createUnorderedList func list = List.map func list

view : PersonalDetails -> Html msg
view details =
   
    div [] [
        h1 [id "name"] [text <| details.name],
        em [id "intro"] [text <| details.intro],
        ul [] (createUnorderedList createContactListItem <| details.contacts),
        ul [] (createUnorderedList createSocialListItem <| details.socials)
    ]
    