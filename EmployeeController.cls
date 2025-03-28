Class Testing.EmployeeController Extends %RegisteredObject
{

// Property EmpRegView As EmployeeRegistrationView [ InitialExpression = {##class(EmployeeRegistrationView).%New()} ];

// Property EmpRegService As EmployeeRegistrationService [ InitialExpression = {##class(EmployeeRegistrationService).%New()} ];

/// Description
ClassMethod HandleEmployeeRegistration() As %Status
{

    Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    Set ConFlag = "*"
    While ConFlag = "*" {
        Set EmpDto = EmpRegView.GetEmployeeDataInput()
        Set OpFlag = EmpRegView.GetOperationInput()
        if (OpFlag = "@") {
            Do EmpRegService.SaveEmployee(EmpDto)
        }
        Set ConFlag = EmpRegView.GetContinueInput()
    }
}

}
