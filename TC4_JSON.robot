*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections

*** Variables ***
${path_file}    C:/Users/admin/Desktop/Json.json

*** Test Cases ***
Testcase1:
    ${json_obj}=        load json from file  ${path_file}
    ${json_value}=      get value from json  ${json_obj}      $.firstName

    log to console  ${json_value}
    should be equal  ${json_value[0]}   John


