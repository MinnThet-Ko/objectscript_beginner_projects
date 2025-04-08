Class Testing.EmployeeRegistrationMain Extends %RegisteredObject
{

/// Description
ClassMethod Main() As %Status
{
        if $DATA(^EmployeeList) = 0 {
        Set ^EmployeeList = $LISTBUILD()
        }
        Set EmpController = ##class(EmployeeController).%New()
        Do EmpController.HandleEmployeeRegistration()
}

}
