*** Settings ***
Library  RequestsLibrary
Library  Collections
*** Variables ***
${base_url}         http://restapi.demoqa.com/customer


*** Test Cases ***
Delete_Records
    create session  mysession   ${base_url}
    ${body}=      create dictionary     FirstName=Ho    LastName=Long  UserName=longcailay2    Password=123    Email=longcailay2@gmail.com
    ${headers}=     create dictionary  Content-Type=application/json
    ${response}=    post request    mysession   /register    data=${body}    headers=${headers}

    #VALIDATIONS
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${content}=     convert to string  ${response.content}
    should contain  ${content}      User already exists
    should contain  ${content}          "fault": "FAULT_USER_ALREADY_EXISTS"


    #Log
    log to console  ${status_code}
    log to console  ${content}

