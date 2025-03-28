Class Testing.EmployeeRegistrationMain Extends %RegisteredObject
{

/// Description
ClassMethod Main() As %Status
{
        Set ^EmployeeList = $LISTBUILD()
        Set EmpController = ##class(EmployeeController).%New()
        Do EmpController.HandleEmployeeRegistration()
}

}
