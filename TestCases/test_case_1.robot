from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(ChromeDriverManager().install())


*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://blogdoagi.com.br/
${BROWSER}        Chrome
${TEXT}           "MUTATION TEST"
${BUTTON_SEARCH}        //button[@id='search-open']
${BUTTON_SEARCH_MID}        (//input[contains(@type,'search')])[1]
${BUTTON_SEARCH_CEN}    (//input[contains(@type,'submit')])[1]
${RESULT}    Nenhum resultado 

*** Test Cases ***
Validar mensagem de artigos sem temas no blog
    Abrir pagina web
    Adicionar pesquisa no campo
    [Teardown]    Close Browser

*** Keywords ***
Abrir pagina web
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Blog do Agi

Adicionar pesquisa no campo
    Click Element    ${BUTTON_SEARCH}  
    Click Element    ${BUTTON_SEARCH_MID}  
    Input Text    ${BUTTON_SEARCH_MID}    ${TEXT} 
    Click Element    ${BUTTON_SEARCH_CEN}
    Page Should Contain Element    ${RESULT}



