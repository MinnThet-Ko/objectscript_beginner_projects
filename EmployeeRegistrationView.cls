Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

Method GetEmployeeDataInput()
{
       
        Set PromptList = $LISTBUILD("Enter employee number:", "Enter employee name (In Kanji):", "Enter employee name (In Katakana):", "Enter employee address:")
        Set InputList = $LISTBUILD()
        Set Index = 1
        For {
            Set Prompt = $LISTGET(PromptList, Index)
            Write !, Prompt
            Read !, Input
            If Input = "/" {
                Continue
            } elseif Input = "//"{
                Set Index = 1
                Continue
            }
            Set $LIST(InputList, Index) = Input 
            Set Index = Index + 1
            QUIT:Index>$LISTLENGTH(PromptList)
        }
        Write !, InputList


        Set EmployeeDTO = ##class(Testing.Employee).%New()
        Do EmployeeDTO.ConvertListToProperties(InputList)
        Return EmployeeDTO
}

Method GetOperationInput()
{
    Read !, "Enter @ to insert, DEL to delete:", OperationFlag
    Return OperationFlag
}

Method GetContinueInput()
{
    Read !, "Enter * to continue:", ContinueFlag
    Return ContinueFlag
}

}
