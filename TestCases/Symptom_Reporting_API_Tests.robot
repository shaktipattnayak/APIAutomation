*** Settings ***
Resource    ../Library/Common_Resources.robot

Suite Setup    Initial Setup
*** Variables ***

*** Test Cases ***
Validate User Login
    [Tags]   Sanity
    ${login_data}   get_login_data
    FOR   ${data}    IN   @{login_data}
        ${status}   Check Login User    ${data}
        run keyword if    ${status} == 200    Fail   Test Failed: Got 200 response code for invalid credentials
    END

Validate Symptoms Registration Without Having Symptom Report Details
    [Tags]   Sanity
    ${Symptom_Regd_true_case}    Get Symptom Regd Feeling Ok True Case
    ${symptom_by_date_payload}   get_symptom_registered_by_date
    ${sympotom_regd_obj}    Symptom Registration    ${Symptom_Regd_true_case}
    log   ${sympotom_regd_obj}
    ${symptom_by_date_obj}    Symptom Registered By Date    ${symptom_by_date_payload}
    log   ${symptom_by_date_obj}
    run keyword  Validate Symptom Regd By Date Response    ${sympotom_regd_obj}   ${symptom_by_date_obj}

Validate Symptoms Registration Having Symptom Report Details
    [Tags]   Sanity
    ${Symptom_Regd_false_case}   Get Symptom Regd Feeling Ok False Case
    ${symptom_by_date_payload}   get_symptom_registered_by_date
    ${sympotom_regd_obj_false}    Symptom Registration    ${Symptom_Regd_false_case}
    log   ${sympotom_regd_obj_false}
    ${symptom_by_date_obj_false}    Symptom Registered By Date    ${symptom_by_date_payload}
    log    ${symptom_by_date_obj_false}
    run keyword  Validate Symptom Regd By Date Response    ${sympotom_regd_obj_false}    ${symptom_by_date_obj_false}

Validate Symptoms Registration Having Wrong Symptom Report Details
    [Tags]   Sanity
    ${Symptom_Regd_false_case}   Get Symptom Regd Feeling Ok False Case
    ${wrong_symptom_report_details}   get_symptom_regd_hvaving_wrong_symptom_report_details
    ${symptom_by_date_payload}   get_symptom_registered_by_date
    ${sympotom_regd_obj_false}    Symptom Registration    ${Symptom_Regd_false_case}
    log   ${sympotom_regd_obj_false}
    ${symptom_by_date_obj_false}    Symptom Registered By Date    ${symptom_by_date_payload}
    log    ${symptom_by_date_obj_false}
    run keyword and ignore error  Validate Symptom Regd By Date Response    ${sympotom_regd_obj_false}    ${Symptom_Regd_false_case}

*** Keywords ***

Initial Setup
    Login User
