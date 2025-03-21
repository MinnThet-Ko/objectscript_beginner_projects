Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

Property EmployeeDTO As Employee [ InitialExpression = {Employee.New()} ];

ClassMethod DisplayPrompts()
{
    Read "Enter employee number:", EmployeeNumber
    Read "Enter employee name (In Kanji):", EmployeeNameKanji
    Read "Enter employee name (In Katakana):", EmployeeNameKana
    Read "Enter employee address", EmployeeAddress

    Set EmployeeDTO = ##class(Testing.Employee).%New()
    Set EmployeeDTO.EmployeeNumber = EmployeeNumber
    Set EmployeeDTO.EmployeeNameKanji = EmployeeNameKanji
    Set EmployeeDTO.EmployeeNameKana = EmployeeNameKana
    Set EmployeeDTO.EmployeeAddress = EmployeeAddress
    #; Write EmployeeDTO.EmployeeNumber
    #; Write EmployeeDTO.EmployeeNameKanji
    #; Write EmployeeDTO.EmployeeNameKana
    #; Write EmployeeDTO.EmployeeAddress
    Do EmployeeDTO.DisplayData()
}

}
