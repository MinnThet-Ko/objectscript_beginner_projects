Class Testing.TestObject Extends %RegisteredObject
{

/// Description
ClassMethod SayHello() As %Status
{
        Write "Hello world!"
}

/// Description
ClassMethod MakeIntroduction() As %Status
{
    Read "Hello, what is your name?", input
    Write "Hello"_input
}

}
