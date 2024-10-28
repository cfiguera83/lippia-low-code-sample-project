@timeEntry
Feature: Time entry


  @Clockify @getTimeEntry
  Scenario: Get time entries for a user on workspace successfully
    Given call User.feature@GetMemberProfile
    And base url $(env.base_url_clockify)
    And endpoint /v1/workspaces/{{workspaceIdMilan}}/user/{{userIdCarlos}}/time-entries
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200


  @Clockify @getEspecificTimeEntry
  Scenario: Get a specific time entry on workspace successfully
    Given base url $(env.base_url_clockify)
    And endpoint /api/v1/workspaces/6716c04becee593703a7eb18/time-entries/671fc2be4a18d82e10071ba2
    And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
    When execute method GET
    Then the status code should be 200
    * define timeEntryCarlos = id


   @Clockify @AddNewTimeEntry
   Scenario: Add a new time entry successfully
     Given base url $(env.base_url_clockify)
     And endpoint /api/v1/workspaces/6716c04becee593703a7eb18/time-entries
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     And header Accept = */*
     And header Content-Type = application/json
     And body jsons/bodies/addTimeEntry.json
     When execute method POST
     Then the status code should be 201
     * define timeEntryTest = id


   @Clockify @UpdateTimeEntry
   Scenario: Update time entry on workspace successfully
     Given base url $(env.base_url_clockify)
     And endpoint /api/v1/workspaces/6716c04becee593703a7eb18/time-entries/671fbafb4ce4600d320feec3
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     And header Accept = */*
     And header Content-Type = application/json
     And body jsons/bodies/updateTimeEntry.json
     When execute method PUT
     Then the status code should be 200


   @Clockify @DeleteTimeEntry @Do
   Scenario: Delete time entry from workspace
     Given base url $(env.base_url_clockify)
     And endpoint /v1/workspaces/6716c04becee593703a7eb18/time-entries/671fdd23a75c3e4ef3b47f72
     And header x-api-key = M2JmMGEwNDEtYzYyMC00MzY5LThlMjktMjYyMDFkM2I1NzVm
     When execute method DELETE
     Then the status code should be 204