*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***
${base_url}     https://kcpm-casestudy.herokuapp.com
${token}    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibGFzdF9uYW1lIjoiVGnhur9uIiwiZmlyc3RfbmFtZSI6IsSQaW5oIELDoSIsImVtYWlsIjoiZGJ0aWVuQGZpdC5oY211cy5lZHUudm4iLCJwaG9uZSI6IjA5MHh4eHgiLCJwYXNzd29yZCI6IiQyYSQxMCR3QlVtbkdUSDQxVnluTEo2S3FaaWouTmJXVTVzVU9CVEtBNS85a0RjRnJJRHFlL3k4WnZ4UyIsInJvbGVfaWQiOjIsImF2YXRhciI6Imh0dHA6Ly9pLmltZ3VyLmNvbS9GVGEySldELnBuZyIsImNyZWF0ZWRfYXQiOiIyMDIwLTAyLTE0VDAyOjQyOjQ0LjkyMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMC0wMi0xNFQwMjo0Mjo0NC45MjBaIiwiaWF0IjoxNTg0OTQ5MzU1LCJleHAiOjE1ODUwMzU3NTV9.8I3gRPd7-Ez1htIo1Fu-ehwotifB_NgP22-t3tQH6U0"

*** Test Cases ***
BearerAuthTest:
#    create session  mysession   ${base_url}
#
#    ${headers}=     create dictionary   x-access-token=${token}     Content-Type=application/json
#

    ${data_file}=   get file    C:/Users/admin/desktop/json.txt

    #${data1}=   convert to dictionary  ${data_file}

    log to console  ${data_file}


