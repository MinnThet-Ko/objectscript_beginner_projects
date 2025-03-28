Class Testing.EmployeeDAO Extends %RegisteredObject
{

Method SaveEmployee(InputEmployee As Employee)
{
    Set $List(^EmployeeList, *+1) = InputEmployee.ConvertToDataList()
}

Method GetEmployeeByIndex(EmployeeIndex As %Numeric)
{
    /*
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
    */
    Return $LISTGET(^EmployeeList, EmployeeIndex)
}

}
