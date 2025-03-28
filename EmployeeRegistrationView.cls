Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

ClassMethod GetEmployeeDataInput()
{

        Read !, "Enter employee number:", !, EmployeeNumber
        Read !, "Enter employee name (In Kanji):", !, EmployeeNameKanji
        Read !, "Enter employee name (In Katakana):", !, EmployeeNameKana
        Read !, "Enter employee address", !, EmployeeAddress

        Set EmployeeDTO = ##class(Testing.Employee).%New()
        Set EmployeeDTO.EmployeeNumber = EmployeeNumber
        Set EmployeeDTO.EmployeeNameKanji = EmployeeNameKanji
        Set EmployeeDTO.EmployeeNameKana = EmployeeNameKana
        Set EmployeeDTO.EmployeeAddress = EmployeeAddress

        Return EmployeeDTO
}

ClassMethod GetOperationInput()
{
    Read !, "Enter @ to insert, DEL to delete:", OperationFlag
    Return OperationFlag
}

ClassMethod GetContinueInput()
{
    Read !, "Enter * to continue:", ContinueFlag
    Return ContinueFlag
}

}
