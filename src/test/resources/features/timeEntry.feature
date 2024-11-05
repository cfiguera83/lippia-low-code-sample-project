@Clockify
Feature: Time entry

   @timeEntry @getTimeEntries
   Scenario: Get time entries for a user on workspace successfully
     Given call User.feature@findAllUsersOnWorkspace
     And base url $(env.base_url_clockify)
     And endpoint /v1/workspaces/{{workspaceIdMilan}}/user/{{userIdCarlos}}/time-entries
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     When execute method GET
     Then the status code should be 200
     And response should be $.[0].description = Automation Test
     * define timeEntryIdAutomation = $.[0].id

  @timeEntry @updateTimeEntry
   Scenario: Update time entry on workspace successfully
     Given call timeEntry.feature@getTimeEntries
     And base url $(env.base_url_clockify)
     And endpoint /v1/workspaces/{{workspaceIdMilan}}/time-entries/{{timeEntryIdAutomation}}
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     And header Accept = */*
     And header Content-Type = application/json
     And body jsons/bodies/updateTimeEntry.json
     When execute method PUT
     Then the status code should be 200

  @timeEntry @addNewTimeEntry
   Scenario: Add a new time entry successfully
     Given call Workspace.feature@GetAllWorkspaces
     And base url $(env.base_url_clockify)
     And endpoint /v1/workspaces/{{workspaceIdMilan}}/time-entries
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     And header Accept = */*
     And header Content-Type = application/json
     And body jsons/bodies/addTimeEntry.json
     When execute method POST
     Then the status code should be 201
     And response should be description = TP Final
    * define idNewTimeEntry = $.id


  @timeEntry @DeleteTimeEntry @Do
   Scenario: Delete time entry from workspace successfully
     Given call timeEntry.feature@addNewTimeEntry
     And base url $(env.base_url_clockify)
     And endpoint /v1/workspaces/{{workspaceIdMilan}}/time-entries/{{idNewTimeEntry}}
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     When execute method DELETE
     Then the status code should be 204