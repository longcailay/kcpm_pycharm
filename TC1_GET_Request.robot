*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://restapi.demoqa.com
${city}     Hanoi

*** Test Cases ***
Get_weatherInfo
    create session  myssion     ${base_url}
    ${response}=  get request     myssion     /utilities/weather/city/${city}
#    log to console  ${response.c string  ${response.status_code}
                                 #    should be equal  ${status_code}  ontent}
#Validations
    ${status_code}=  convert to200

    ${content}=  convert to string  ${response.content}
    should contain      ${content}      Hanoi

    ${content_type}=        get from dictionary  ${response.headers}    Content-Type
    should be equal  ${content_type}    application/json
