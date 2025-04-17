Class Testing.EmployeeController Extends %RegisteredObject
{

// Property EmpRegView As EmployeeRegistrationView [ InitialExpression = {##class(EmployeeRegistrationView).%New()} ];

// Property EmpRegService As EmployeeRegistrationService [ InitialExpression = {##class(EmployeeRegistrationService).%New()} ];

Property EmployeeDTO As Testing.Employee;

Property OperationFlag As %String;

Property ContinueFlag As %String;

Property CursorPostion As %Integer;

/// Description
Method HandleEmployeeRegistration() As %Status
{

    Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    Do {
        Do EmpRegView.GetEmployeeDataInput()
        Do EmpRegView.GetOperationInput()
        if (EmpRegView.OperationFlag = "@") {
            Do EmpRegService.SaveEmployee(EmpRegView.EmployeeDTO)
        } elseif (EmpRegView.OperationFlag = "DEL"){
            Do EmpRegService.DeleteEmployee(EmpRegView.EmployeeDTO)
        }
        Do EmpRegView.GetContinueInput()
    } While '(EmpRegView.ContinueFlag = "$")
}

Method HandleSearchEmployee(%EmployeeId As %Integer) As %Status
{
    Set EmpDto = ##Class(Testing.Employee).%New()
    Set EmpDto.EmployeeNumber =  %EmployeeId
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    return EmpRegService.CheckExistingEmployee(EmpDto)
}

}
