*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders:
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /photos

    #log to console  ${response.headers}

    ${contentTypeValue}=    get from dictionary  ${response.headers}    Content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8

    ${contentEncodingValue}=    get from dictionary  ${response.headers}    Content-Encoding
    should be equal  ${contentEncodingValue}    gzip

TestCookies:
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /photos

    #log to console  ${response.cookies} #Display all the cookies from response

    ${cookiesValue}=    get from dictionary  ${response.cookies}    __cfduid
    log to console  ${cookiesValue} #Display specific cookies value
    
