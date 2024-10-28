
Feature: Users

  @Clockify @User @GetMemberProfile
  Scenario: Get member's profile successfully
    Given call Project.feature@FindProjectByID
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/member-profile/671d7beac9a7b24e6b00f5de
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    * define userIdCarlos = id