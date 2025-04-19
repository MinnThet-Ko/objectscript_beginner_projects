ROUTINE TestInclude [Type=INC]

SayHelloWorld
    write "Hello, I am from TestInclude file."
    
DisplayPermissionMasterRecord(%PermissionID)
    w ^MKEN1MTK(%PermissionID, "管理グループ")_":"_^MKEN1MTK(%PermissionID, "更新日")_":"_^MKEN1MTK(%PermissionID, "登録日")
    Quit

