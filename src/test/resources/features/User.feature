@Clockify
Feature: Users

  @User @findAllUsersOnWorkspace
  Scenario: Find all users on workspace successfully
    Given call Project.feature@GetAllProjectsOnWorkspace
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/users?includeRoles=true
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[0].name = Carlos
    * define userIdCarlos = $.[0].id

  @User @findAllUsersOnWorkspacePrueba
  Scenario: Find all users on workspace successfully
    Given call Project.feature@GetAllProjectsOnWorkspace
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/users?includeRoles=true
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[1].name = Pruebaacademy
    * define userIdPrueba = $.[1].id