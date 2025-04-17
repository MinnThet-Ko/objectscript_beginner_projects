Class Testing.EmployeeRegistrationView Extends %RegisteredObject
{

Property EmployeeDTO As Testing.Employee;

Property OperationFlag As %String;

Property ContinueFlag As %String;

Property Input As %String;

Property CursorY As %Integer;

Method DisplayPrompt(%Prompt As %String)
{
    Write !,%Prompt
    Read Input
    Set $THIS.Input = Input
}

Method GetOperationInput()
{
    Read !, "<@=登録、DEL=削除、/ or //=行選択、$=終了>", Input
    Set $THIS.OperationFlag = Input
}

}
