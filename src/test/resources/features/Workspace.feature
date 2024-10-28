
Feature: Workspace

  @Clockify @Workspace @GetWorkspaceInfo
  Scenario: Get workspace info succesfully
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/6716c04becee593703a7eb18
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    * define workspaceIdMilan = id

  @Clockify @Workspace @GetAllWorkspaces
  Scenario: Get all my workspaces succesfully
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[4].name = Milan



