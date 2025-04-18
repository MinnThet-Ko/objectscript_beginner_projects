Class Testing.EmployeeController Extends %RegisteredObject
{

// Property EmpRegView As EmployeeRegistrationView [ InitialExpression = {##class(EmployeeRegistrationView).%New()} ];

// Property EmpRegService As EmployeeRegistrationService [ InitialExpression = {##class(EmployeeRegistrationService).%New()} ];

Property EmployeeDTO As Testing.Employee;

Property OperationFlag As %String;

Property ContinueFlag As %String;

Property CursorPostionX As %Integer;

Property CursorPostionY As %Integer;

/// Description
Method HandleEmployeeRegistration() As %Status
{

    Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    Do {
        Do $This.HandleMenuDisplay()
        Do EmpRegView.GetOperationInput()
        //Guard condition for terminating the program
        if (EmpRegView.OperationFlag = "$") {
            QUIT
        }

        if (EmpRegView.OperationFlag = "@") {
            if (EmpRegService.ValidateUserInput($THIS.EmployeeDTO) = 0) {
                Do EmpRegService.SaveEmployee($THIS.EmployeeDTO)
                W !, "登録成功です。"
            } else {
                W !, "英数字禁止。"
            }
            
        } elseif (EmpRegView.OperationFlag = "DEL"){
            Do EmpRegService.DeleteEmployee($THIS.EmployeeDTO)
            W !, "削除成功です。"
        }

    } While '(EmpRegView.OperationFlag = "$")
}

Method HandleMenuDisplay()
{
        Set EmpRegView = ##class(Testing.EmployeeRegistrationView).%New()
        Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
        Set Util = ##class(Testing.Util).%New()
        Write !, "***社員登録PG***"
        Set PromptList = $LISTBUILD("社員番号＝", "氏名漢字＝", "氏名カナ＝", "住所＝")
        Set InputList = $LISTBUILD()
        Set Index = 1
        For {
            Set Prompt = $LISTGET(PromptList, Index)
            Do EmpRegView.DisplayPrompt(Prompt)

            //Handling existing user
            Set isExistingEmployee = $THIS.HandleSearchEmployee(EmpRegView.Input)
            if (Index = 1 && '(isExistingEmployee = -1)) {
                Set $THIS.EmployeeDTO = ##class(Testing.Employee).%New()
                Do $THIS.EmployeeDTO.ConvertListToProperties(EmpRegService.GetEmployee(isExistingEmployee))
                Write !, $CHAR(EmpRegService.GetEmployee(isExistingEmployee))
                Do Util.DisplayList(EmpRegService.GetEmployee(isExistingEmployee))
                Return
            }

            //Handling backward inputs for now (I have no idea how to manipulate the cursor.)
            If EmpRegView.Input = "/" {
                Continue
            } elseif EmpRegView.Input = "//"{
                Set Index = 1
                Continue
            }
            Set $LIST(InputList, Index) = $ZSTRIP(EmpRegView.Input, "<>W") 
            Set Index = Index + 1
            QUIT:Index>$LISTLENGTH(PromptList)
        }
        Do Util.DisplayList(EmpRegService.GetEmployee(InputList))


        Set $THIS.EmployeeDTO = ##class(Testing.Employee).%New()
        Do $THIS.EmployeeDTO.ConvertListToProperties(InputList)
}

Method HandleSearchEmployee(%EmployeeId As %Integer) As %Status
{
    Set EmpDto = ##Class(Testing.Employee).%New()
    Set EmpDto.EmployeeNumber =  %EmployeeId
    Set EmpRegService = ##class(Testing.EmployeeRegistrationService).%New()
    return EmpRegService.CheckExistingEmployee(EmpDto)
}

}
