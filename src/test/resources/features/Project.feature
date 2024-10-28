
Feature: Project

  @Clockify @Project @FindProjectByID
  Scenario: Find project by id successfully
    Given call Workspace.feature@GetWorkspaceInfo
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/projects/6716c04b19e6b96f5f5b5174
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    * define projectIdBarcelona = id
