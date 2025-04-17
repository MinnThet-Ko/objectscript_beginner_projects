Class Testing.EmployeeController Extends %RegisteredObject
{

// Property EmpRegView As EmployeeRegistrationView [ InitialExpression = {##class(EmployeeRegistrationView).%New()} ];

// Property EmpRegService As EmployeeRegistrationService [ InitialExpression = {##class(EmployeeRegistrationService).%New()} ];

/// Description
Method HandleEmployeeRegistration() As %Status
{

    Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    Do {
        Do EmpRegView.GetEmployeeDataInput()
        Do EmpRegView.GetOperationInput()
        if (OpFlag = "@") {
            Do EmpRegService.SaveEmployee(EmpDto)
        } elseif (OpFlag = "DEL"){
            Do EmpRegService.DeleteEmployee(EmpDto)
        }
        Set ConFlag = EmpRegView.GetContinueInput()
    } While '(ConFlag = "$")
}

}
