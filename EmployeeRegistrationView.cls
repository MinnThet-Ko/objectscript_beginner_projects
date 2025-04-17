Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

Property EmployeeDTO As Testing.Employee;

Property OperationFlag As %String;

Property ContinueFlag As %String;

Property Input As %String;

Property CursorY As %Integer;

Method GetEmployeeDataInput()
{
        Write !, "***社員登録PG***"
        Set PromptList = $LISTBUILD("社員番号＝", "氏名漢字＝", "氏名カナ＝", "住所＝")
        Set InputList = $LISTBUILD()
        Set Index = 1
        For {
            Set Prompt = $LISTGET(PromptList, Index)
            Write !, Prompt
            Read Input
            If Input = "/" {
                Set Index = Index - 1
                Continue
            } elseif Input = "//"{
                Set Index = 1
                Continue
            }
            Set $LIST(InputList, Index) = $ZSTRIP(Input, "<>W") 
            Set Index = Index + 1
            QUIT:Index>$LISTLENGTH(PromptList)
        }
        Write !, InputList


        Set $THIS.EmployeeDTO = ##class(Testing.Employee).%New()
        Do $THIS.EmployeeDTO.ConvertListToProperties(InputList)
}

Method DisplayPrompt(%Prompt As %String)
{
    Read !, %Prompt, Input
    Set $THIS.Input = Input
}

Method GetOperationInput()
{
    Read !, "@:登録、DEL:削除", Input
    Set $THIS.OperationFlag = Input
}

Method GetContinueInput()
{
    Read !, "$:終了行番号", Input
    Set $THIS.ContinueFlag = Input
}

}
