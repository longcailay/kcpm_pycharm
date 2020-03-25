*** Settings ***
Library  XML
Library  os
Library  Collections

*** Test Cases ***
TestCase1
    ${xml_obj} =    parse xml C:/SeleniumPractice/xmldata/employees.xml

    #VALIDATIONS
    #Val1 _Check the Single Element value
    #Approach1
    ${emp_firstname}=   get element text  ${xml_obj}   .//employee[1]/firstname
    should be equal  ${emp_firstname} John

    #Approach2
    ${emp_firstname}= get element text ${xml_obj}   .//employee[1]/firstname
    should be equal  ${emp_firstname.text}  John

    #Approach3
    element text should be  ${xml_obj} John     .//employee[1]/firstname

    #Val2- Check Number of elements
    ${count}=   get element count  ${xml_obj}   .//employee
    should be equal as integers  ${count}   6

    #Val3 - Check attribute presence
    element attribute should be  ${xml_obj} id be129    .//employee[1]
    element attribute should be  ${xml_obj} id be135    .//employee[6]

    #Val4 - Check values of child elements
    ${child_Elements}=  get child elements  ${xml_obj}  .//employee[1]
    should not be empty  ${child_Elements}

    ${fname}=   get element text  ${child_Elements[0]}
    ${lname}=   get element text  ${child_Elements[1]}
    ${title}=   get element text  ${child_Elements[2]}


    log to console  ${fname}
    log to console  ${lname}
    log to console  ${title}

    should be equal  ${fname}   John
    should be equal  ${lname}   Doe
    should be equal  ${title}   Engineer






