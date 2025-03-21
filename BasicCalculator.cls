Class Testing.BasicCalculator Extends %RegisteredObject
{

Property FirstOperand As %Numeric [ InitialExpression = 0 ];

Property SecondOperand As %Numeric [ InitialExpression = 0 ];

Property OperationType As %Numeric [ InitialExpression = 0 ];

ClassMethod GetUserInput()
{
    Set FlagInput = 0
    Read "Enter the first operand:", FirstOperand
    Read "Enter the second operand", SecondOperand
    Read "Enter an operation: \n1. Add \n2. Subtract \n3. Multiply \n4. Divide", OperationType
    if (OperationType = 1 ){
        //Do ..Add()
        Write FirstOperand+SecondOperand
    }elseif (OperationType = 2){
        //Do ..Subtract()
        Write FirstOperand-SecondOperand
    }elseif (OperationType = 3){
        //Do ..Multiply()
        Write FirstOperand*SecondOperand
    }else{
        //Do ..Divide()
        Write FirstOperand/SecondOperand
    }

    Read "Enter 0 to coninue.", FlagInput
    if (FlagInput = 0){
        Do ..GetUserInput()
    }
}

/// Adds two number
ClassMethod Add() As %Status
{
    Write FirstOperand + SecondOperand
}

ClassMethod Subtract() As %Status
{
    Write FirstOperand - SecondOperand
}

ClassMethod Multiply() As %Status
{
    Write FirstOperand * SecondOperand
}

ClassMethod Divide() As %Status
{
    Write FirstOperand / SecondOperand
}

}
