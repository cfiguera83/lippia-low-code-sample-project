@Clockify
Feature: Workspace

  @Workspace @GetAllWorkspaces
  Scenario: Get all my workspaces succesfully
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    And header Content-Type = application/json
    When execute method GET
    Then the status code should be 200
    And response should be $.[0].name = Milan
    * define workspaceIdMilan = $.[0].id