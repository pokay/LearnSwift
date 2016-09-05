//
//  dbmanage.swift
//  superNotepad
//
//  Created by 庞谦 on 16/8/30.
//  Copyright © 2016年 pokay. All rights reserved.
//

import Foundation
import SQLite

internal class dbmanage{
    init(){}
let DBFILE_NAME = "notepad.sqlite"
var db : Connection?

//获取数据库文件夹的位置
func applicationDocumentsDirectoryFile() -> String{
    let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    let path = documentDirectory + "/" + DBFILE_NAME//documentDirectory[0].stringbyAppendingPathComponent(DBFILE_NAME) as String
    NSLog("path: %@",path)
    
    return path
}

//获取数据库连接
func getConnection() ->Int{
    do {
       db = try Connection(applicationDocumentsDirectoryFile())
    }
    catch _{
        return 0
    }
    return 1
}

//创建表
private func createTable() {
    if getConnection() == 1{
    let TMPTABLE = Table("tmptb")
    let id = Expression<Int64>("id")
    let username = Expression<String?>("username")
    let password = Expression<String?>("password")
    
    do{
        try db!.run(TMPTABLE.create(ifNotExists: true){t in
            t.column(id,primaryKey:true)
            t.column(username,unique:true)
            t.column(password,unique:true)
            
            })
    }
    catch _{
    NSLog("错误！", "")
    }
    }
}
func createTableTest(){
    createTable()
}
//func getSysConfig(){}
}
