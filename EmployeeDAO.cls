Class Testing.EmployeeDAO Extends %RegisteredObject
{

Method SaveEmployee(InputEmployee As Employee)
{
    Write !, InputEmployee.EmployeeNumber
    Set $List(^EmployeeList, *+1) = InputEmployee.ConvertToDataList()
}

Method GetEmployeeByEmployeeNumber(EmployeeNumber As %String){
    
    Set EmployeeCount = $LISTLENGTH(^EmployeeList) 
    Set index = 2
    For {
        Write !, "In the loop", index
                
        Set EmpPropList = $LISTGET(^EmployeeList, index)
        If $LISTGET(EmpPropList, 1) = EmployeeNumber{
            Return EmpPropList
        }
                
        Set index = index + 1
        QUIT:index>EmployeeCount
    }
    
}

Method GetEmployeeByIndex(EmployeeIndex As %Numeric)
{
    Return $LISTGET(^EmployeeList, EmployeeIndex)
}

Method DeleteEmployeeByIndex(EmployeeIndex As %Numeric){
    Set $LIST(^EmployeeList, EmployeeIndex, EmployeeIndex) = ""
}
}
