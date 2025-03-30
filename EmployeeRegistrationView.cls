Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

Method GetEmployeeDataInput()
{
        Write !, "***社員登録PG***"
        Set PromptList = $LISTBUILD("社員番号＝", "氏名漢字＝", "氏名カナ＝", "住所＝")
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
    Read !, "@:登録、DEL:削除", OperationFlag
    Return OperationFlag
}

Method GetContinueInput()
{
    Read !, "$:終了行番号", ContinueFlag
    Return ContinueFlag
}

}
