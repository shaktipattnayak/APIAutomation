*** Settings ***
Documentation    Common variables and keywords file for Online Assessment project
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    String
Library   ../TestData/Symptom_Reporting_Payload.py
Library   ../Resources/symptom_registration.py

Resource   ../Utility/API_Helper.robot


*** Variables ***
${user_credential}    /admin/token/dev122@yopmail.com/Test@123
${base_url}     https://dev.np-testzonehealth.com
