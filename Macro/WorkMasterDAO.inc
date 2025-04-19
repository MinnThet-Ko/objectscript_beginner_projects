ROUTINE Testing.Macro.WorkMasterDAO [Type=INC]

DisplayWorkMasterRecord(%WorkID)
    w ^MDIC(%WorkID, "管理グループ")_":"_^MDIC(%WorkID, "更新日")_":"_^MDIC(%WorkID, "登録日")

DeleteWorkMasterRecord(%WorkID)
    Kill ^MDIC(%WorkID, "管理グループ")
    Kill ^MDIC(%WorkID, "更新日")
    Kill ^MDIC(%WorkID, "登録日")
    Kill ^MDIC(%WorkID)

FindWorkStartWith(%Field, %CriteriaValue)
    Set key = $Order(^MDIC(""))
    Set resultList = $LISTBUILD()
    Set Index = 1
    While (key '= "") {

        if %Field = "" {
            if $EXTRACT(key) = %CriteriaValue {
                set tempList = ConvertWorkPropertiesToList(key)
                set $List(resultList, index) = tempList
                set index = index +1 
            }
        } else {
            if ($EXTRACT($g(^MDIC(key,%Field))) = %CriteriaValue) {
                set tempList = ConvertWorkPropertiesToList(key)
                set $List(resultList, index) = tempList
                set index = index +1 
            }
        }

        
        // Find next node
        Set key = $Order(^EmployeeTree(key))
        
    }
    q

FindWorkContain(%Field, %CriteriaValue)
    Set key = $Order(^MDIC(""))
    Set resultList = $LISTBUILD()
    Set Index = 1
    While (key '= "") {
        
        if ($g(^MDIC(key,%Field))[%CriteriaValue) {
            set tempList = ConvertWorkPropertiesToList(key)
            set $List(resultList, index) = tempList
            set index = index +1 
        }
        // Find next node
        Set key = $Order(^EmployeeTree(key))
        
    }
    q

ConvertWorkPropertiesToList(%WorkID)
    set tempList = $LISTBUILD()
    set $List(tempList, 1) = ^MDIC(key, "管理グループ")
    set $List(tempList, 2) = ^MDIC(key, "更新日")
    set $List(tempList, 3) = ^MDIC(key, "登録日")
    return tempList
    q

