*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***
${base_url}     https://maps.googleapis.com
${req_uri}      /maps/api/place/nearbysearch/json?

*** Test Cases ***
GoogleMapPlacesAPITC
    create session      mysession       ${base_url}
    ${params}   create dictionary  location=-33.8670522,151.1957362     radius=500      types=food      name=harbour    key=AIzaSyAc9od_Jnqec4eZf_LD4HgsCJCeoXsohO0
    ${response}=    get request     mysession      ${req_uri}      params=${params}

    log to console  ${response.status_code}
    log to console  ${response.content}
    ${data}=    convert to string  ${response.content}
    create file    C:/Users/admin/desktop/a.txt     ${data}