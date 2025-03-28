Class Testing.EmployeeRegistrationService Extends %RegisteredObject
{

/// Description
Method SaveEmployee(InputEmployee As Employee) As %Status
{
    Set EmpDao = ##class(Testing.EmployeeDAO).%New()
    Set isExistingEmployee = $This.CheckExistingEmployee(InputEmployee)
    Write !, isExistingEmployee
    if (isExistingEmployee = -1){
        Do EmpDao.SaveEmployee(InputEmployee.ConvertToDataList())
        Write !, $LISTGET(^EmployeeList, $LISTLENGTH(^EmployeeList))
    } else {
        Write $This.GetEmployee(isExistingEmployee)
    }
}

/// Description
Method ValidateEmployeeData(InputEmployee As Employee) As %Status
{
        Set ErrorMessages = $LISTBUILD()
        if ($Length(InputEmployee.EmployeeNumber) > 4){
            Set $List(ErrorMessages, $LENGTH(ErrorMessages)) = "The employee number should be 4 digits."
        }
        Return ErrorMessages
}

/// Find the Employee in the global list
/// $LISTFIND() would not work in this situation.
Method CheckExistingEmployee(InputEmployee As Employee) As %Status
{
   
    Set EmployeeCount = $LISTLENGTH(^EmployeeList) 
    Try{
        Write !, "List lenght:", EmployeeCount
        if EmployeeCount > 1 {
            
            Set index = 2
            For {
                Write !, "In the loop", index
                
                Set EmpPropList = $LISTGET(^EmployeeList, index)
                Write $LISTGET(EmpPropList, 1)
                If $LISTGET(EmpPropList, 1) = InputEmployee.EmployeeNumber{
                    Return index
                }
                
                Set index = index + 1
                QUIT:index>EmployeeCount
            }
            /*
            For i = 1: 1: EmployeeCount+1{
                Set EmpPropList = $LISTGET(^EmployeeList, i)
                Write $LISTGET(^EmployeeList, 1)
            }
            */
        }
        
        Return -1
    } Catch ErrorObj {
        Write !, "In the Exception"
        if (ErrorObj.Name = "<NULL VALUE>"){
            Return -1
        }

        if (ErrorObj.Name = "<COMMAND>"){
            Return -1
        }
        
    }
}

Method GetEmployee(EmployeeIndex As %Numeric) As %Status
{
    Set EmpDao = ##class(Testing.EmployeeDAO).%New()
    Return EmpDao.GetEmployeeByIndex(EmployeeIndex)
}

}
