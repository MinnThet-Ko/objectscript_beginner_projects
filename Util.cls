Class Testing.Util Extends %RegisteredObject
{

/// Description
ClassMethod DisplayList(%StringList As %List) As %Status
{
            For i = 1: 1: $LISTLENGTH(%StringList){   
                Write !, $LISTGET(%StringList, i)
            }
}

}
