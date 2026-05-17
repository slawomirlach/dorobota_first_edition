*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application. https://petstore.swagger.io/
Library           RequestsLibrary

*** Keywords ***
Create Session
    [Documentation]    This keyword creates a session to the Pet Store API.
    RequestsLibrary.Create Session    petstore    https://petstore.swagger.io/v2

Create Pet
    [Documentation]    This keyword creates a new pet in the Pet Store API.
    [Arguments]    ${pet_id}    ${pet_name}    ${pet_status}
    ${pet_data}    Create Dictionary    id=${pet_id}    name=${pet_name}    status=${pet_status}
    ${response}    RequestsLibrary.POST On Session    petstore    /pet    json=${pet_data}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()}

Get Pet By ID
    [Documentation]    This keyword retrieves a pet by its ID from the Pet Store API.
    [Arguments]    ${pet_id}
    ${response}    RequestsLibrary.GET On Session    petstore    /pet/${pet_id}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()}
