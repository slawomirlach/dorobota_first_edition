*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application.
Resource          ../Resources/handler.resource

*** Test Cases ***
Test Case 1
    [Documentation]    This is the first test case that tests the functionality of the application.
    Log    This is the first test case.
    PetStore_REST_API.Create Session
    PetStore_REST_API.Pet: Create Pet    12345    Fluffy    available
    ${pet}    PetStore_REST_API.Pet: Get Pet By ID    12345

Test Case 2
    [Documentation]    This is the second test case that tests the functionality of the application.
    Log    This is the second test case.
    PetStore_REST_API.Pet: Create And Get Pet By ID    54321    Spike    sold
