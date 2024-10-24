@Clockify
Feature: Projects

  @Project @addProject
  Scenario: Add a new project successfully
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    And header Content-Type = application/json
    And body jsons/bodies/addProject.json
    When execute method POST
    Then the status code should be 201

  @Project @getAllProjects
  Scenario: Get all projects from workspace successfully
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.[5].name = Vigo
    * define projectId = $.[5].id

  @Project @findProjectById
  Scenario: Find project by id successfully
    Given call clockifyProjects.feature@getAllProjects
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    And response should be $.name = Vigo

  @Project @UpdateProject
  Scenario: Update project estimate successfully
    Given call clockifyProjects.feature@getAllProjects
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    And header Content-Type = application/json
    And set value "Prueba" of key note in body jsons/bodies/updateProject.json
    When execute method PUT
    Then the status code should be 200

  @Project @BadRequestfindProjectById
  Scenario: Bad request finding a project by id successfully
    Given base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/$(env.WORKSPACE_ID_MILAN)/projects/$(env.PROJECT_ID_BARCELONA)
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 400


  @Project @getAllProjectsNoApiKey
  Scenario: Get all projects from workspace with no Api Key successfully
    Given call clockifyWorkspace.feature@getAllWorkspaces
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 401

  @Project @findProjectByInvalidId
  Scenario: Find project by invalid id successfully
    Given call clockifyProjects.feature@getAllProjects
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/6716c04becee593703a7eb18/project/6717f2d8814afb63a579a9a3
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 404

  @Project @deleteProject
  Scenario: Delete project successfully
    Given call clockifyProjects.feature@getAllProjects
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method DELETE
    Then the status code should be 200