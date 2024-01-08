*** Settings ***
Resource    ../Library/Common_Resources.robot

*** Variables ***

*** Keywords ***
Login User
    [Documentation]  Logging in a user and get the session token.
    create session  url   ${base_url}   verify=True
    ${response}=   GET On Session   url    ${user_credential}
    ${status_code}=    convert to string    ${response.status_code}
    log   ${status_code}
    ${user_token}   catenate     Bearer    ${response.content}
    set suite variable    ${user_token}

Symptom Registration
    [Arguments]    ${symptom_regd}
    [Documentation]  Register symptoms
    ${Header}=    create dictionary    Authorization=${user_token}     Content-Type=application/json
    ${response} =   POST On Session   url    /zone/1/user/symptoms    json=${symptom_regd}     headers=${Header}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}   201
    [Return]    ${response.json()}

Symptom Registered By Date
    [Arguments]    ${symptom_by_date}
    [Documentation]  Check symptom registration response by date
    ${Header}=    create dictionary    Authorization=${user_token}     Content-Type=application/json
    ${response} =   POST On Session   url    /zone/1/user/symptoms/by-date   json=${symptom_by_date}     headers=${Header}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}   200
    [Return]    ${response.json()}
