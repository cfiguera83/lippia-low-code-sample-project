@Clockify
Feature: Project

  @Project @GetAllProjectsOnWorkspace
  Scenario: Get all projects on workspace successfully
    Given call Workspace.feature@GetAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/projects
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[0].name = Barcelona
    * define projectIdBarcelona = $.[0].id
