Class Testing.EmployeeController Extends %RegisteredObject
{

// Property EmpRegView As EmployeeRegistrationView [ InitialExpression = {##class(EmployeeRegistrationView).%New()} ];

// Property EmpRegService As EmployeeRegistrationService [ InitialExpression = {##class(EmployeeRegistrationService).%New()} ];

/// Description
Method HandleEmployeeRegistration() As %Status
{
    Write !, "Hey, the change really is reflected"
    
    Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    Set ConFlag = "*"
    While ConFlag = "*" {
        Set EmpDto = EmpRegView.GetEmployeeDataInput()
        Set OpFlag = EmpRegView.GetOperationInput()

        Write !, EmpDto.EmployeeNumber
        if (OpFlag = "@") {
            Do EmpRegService.SaveEmployee(EmpDto)
        } elseif (OpFlag = "DEL"){
            Do EmpRegService.DeleteEmployee(EmpDto)
        }
        Set ConFlag = EmpRegView.GetContinueInput()
    }
}

}
