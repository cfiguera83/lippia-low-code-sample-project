@clockify
Feature: Workspace

  @Workspace @getAllWorkspaces
  Scenario: Get all workspaces
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[0].name = Test
    * define workspaceId = $.[0].id


  @Workspace @getWorkspacesInfo
  Scenario: Get workspaces info
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200


  @Workspace @addWorkspace
  Scenario: Add workspace
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    And header Content-Type = application/json
    And body jsons/bodies/addWorkspace.json
    When execute method POST
    Then the status code should be 201
    * define workspaceIdMilan = $.id


  @Workspace @addClient
  Scenario: Add client
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    And header Content-Type = application/json
    And body jsons/bodies/addClient.json
    When execute method POST
    Then the status code should be 201


  @Workspace @findClientsOnWorkspace
  Scenario: Find client on workspace
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[0].name = Client X
    * define clientId = $.[0].id


  @Workspace @deleteClient
  Scenario: Delete client
    Given call clockifyWorkspace.feature@findClientsOnWorkspace
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/clients/{{clientId}}
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method DELETE
    Then the status code should be 200