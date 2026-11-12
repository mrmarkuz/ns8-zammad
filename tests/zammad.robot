*** Settings ***
Library    SSHLibrary

*** Test Cases ***
Check if zammad is installed correctly
    ${output}  ${rc} =    Execute Command    add-module ${IMAGE_URL} 1
    ...    return_rc=True
    Should Be Equal As Integers    ${rc}  0
    &{output} =    Evaluate    ${output}
    Set Suite Variable    ${module_id}    ${output.module_id}

Check if zammad can be configured
    ${rc} =    Execute Command    api-cli run module/${module_id}/configure-module --data '{"host":"zammad.test.local","http2https": true,"lets_encrypt": false}'
    ...    return_rc=True  return_stdout=False
    Should Be Equal As Integers    ${rc}  0

Check if zammad works as expected
    ${rc} =    Execute Command    sleep 60 && curl --resolve zammad.test.local:443:127.0.0.1 -fkL https://zammad.test.local
    ...    return_rc=True  return_stdout=False
    Should Be Equal As Integers    ${rc}  0

Check if zammad is removed correctly
    ${rc} =    Execute Command    remove-module --no-preserve ${module_id}
    ...    return_rc=True  return_stdout=False
    Should Be Equal As Integers    ${rc}  0
