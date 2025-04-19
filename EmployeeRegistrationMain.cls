Class Testing.EmployeeRegistrationMain Extends %RegisteredObject
{

/// This is the entry point of the program.
/// Do 
ClassMethod Main() As %Status
{
        if $DATA(^EmployeeList) = 0 {
        Set ^EmployeeList = $LISTBUILD()
        }
        Set EmpController = ##class(EmployeeController).%New()
        Do EmpController.HandleEmployeeRegistration()
}

}
