ROUTINE Testing.Macro.PermissionMasterDAO [Type=INC]

DisplayPermissionMasterRecord(%PermissionID)
    w ^MKEN1MTK(%PermissionID, "管理グループ")_":"_^MKEN1MTK(%PermissionID, "更新日")_":"_^MKEN1MTK(%PermissionID, "登録日")
    Quit
    
DeletePermissionMasterRecord(%PermissionID)
    Kill ^MKEN1MTK(%PermissionID, "管理グループ")
    Kill ^MKEN1MTK(%PermissionID, "更新日")
    Kill ^MKEN1MTK(%PermissionID, "登録日")
    Kill ^MKEN1MTK(%PermissionID)
    q

FindPermissionStartWith(%Field, %CriteriaValue)
    Set key = $Order(^MKEN1MTK(""))
    Set resultList = $LISTBUILD()
    Set Index = 1
    While (key '= "") {

        if %Field = "" {
            if $EXTRACT(key) = %CriteriaValue {
                set tempList = ConvertPermissionPropertiesToList(key)
                set $List(resultList, index) = tempList
                set index = index +1 
            }
        } else {
            if ($EXTRACT($g(^MKEN1MTK(key,%Field))) = %CriteriaValue) {
                set tempList = ConvertPermissionPropertiesToList(key)
                set $List(resultList, index) = tempList
                set index = index +1 
            }
        }

        
        // Find next node
        Set key = $Order(^EmployeeTree(key))
        
    }
    q

FindPermissionContain(%Field, %CriteriaValue)
    Set key = $Order(^MKEN1MTK(""))
    Set resultList = $LISTBUILD()
    Set Index = 1
    While (key '= "") {
        
        if ($g(^MKEN1MTK(key,%Field))[%CriteriaValue) {
            set tempList = ConvertPermissionPropertiesToList(key)
            set $List(resultList, index) = tempList
            set index = index +1 
        }
        // Find next node
        Set key = $Order(^EmployeeTree(key))
        
    }
    q

ConvertPermissionPropertiesToList(%PermissionID)
    set tempList = $LISTBUILD()
    set $List(tempList, 1) = ^MKEN1MTK(%PermissionID, "管理グループ")
    set $List(tempList, 2) = ^MKEN1MTK(%PermissionID, "更新日")
    set $List(tempList, 3) = ^MKEN1MTK(%PermissionID, "登録日")
    return tempList
    q

