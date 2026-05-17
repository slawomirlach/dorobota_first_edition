*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application.
Resource          lib_handler.resource


*** Variables ***
${id_userName}    userName
${id_userEmail}    userEmail
${id_currentAddress}    currentAddress
${id_permanentAddress}    permanentAddress
${id_submit}    submit
${id_output}    output

# resource nie używany w projekcie, ale pokazuje jak można wydzielić moduł jako osobny resource, który będzie zawierał tylko elementy związane z Text Box'em
# jest to forma "Page Object Model" w Robot Framework, gdzie każdy resource odpowiada za jedną stronę lub moduł aplikacji

*** Keywords ***
Text Box: Fill Form
    [Documentation]    This keyword fills the text box form with the provided data.
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    SeleniumLibrary.Input Text    id=${id_userName}    ${full_name}
    SeleniumLibrary.Input Text    id=${id_userEmail}    ${email}
    SeleniumLibrary.Input Text    id=${id_currentAddress}    ${current_address}
    SeleniumLibrary.Input Text    id=${id_permanentAddress}    ${permanent_address}

Text Box: Click Submit
    [Documentation]    This keyword clicks the submit button on the text box form.
    SeleniumLibrary.Click Button    id=${id_submit}

Text Box: Get Output
    [Documentation]    This keyword retrieves the output from the text box form after submission.
    ${output}    SeleniumLibrary.Get Text    id=${id_output}
    RETURN    ${output}

Text Box: Verify Output
    [Documentation]    This keyword verifies the output from the text box form after submission.
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    ${actual_output}    Text Box: Get Output    
    Should Contain    ${actual_output}    Name:${full_name}
    Should Contain    ${actual_output}    Email:${email}
    Should Contain    ${actual_output}    Current Address :${current_address}
    Should Contain    ${actual_output}    Permananet Address :${permanent_address}
