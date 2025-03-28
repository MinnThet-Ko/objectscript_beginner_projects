Class Testing.Employee Extends %RegisteredObject
{

Property EmployeeNumber As %String;

Property EmployeeNameKanji As %String;

Property EmployeeNameKana As %String;

Property EmployeeAddress As %String;

Method ConvertToDataList() As %Status
{
    Set propertyArray = $LISTBUILD($This.EmployeeNumber, $This.EmployeeNameKanji, $This.EmployeeNameKana, $This.EmployeeAddress)
    Return propertyArray
}

Method ConvertListToProperties(InputList)
{
    Set $This.EmployeeNumber = $LISTGET(InputList,1)
    Set $This.EmployeeNameKanji = $LISTGET(InputList,2)
    Set $This.EmployeeNameKana = $LISTGET(InputList,3)
    Set $This.EmployeeAddress = $LISTGET(InputList,4)
}

/// Description
Method DisplayData() As %Status
{
    Write !, $This.EmployeeNumber
    Write !, $This.EmployeeNameKanji
    Write !, $This.EmployeeNameKana
    Write !, $This.EmployeeAddress
}

}
