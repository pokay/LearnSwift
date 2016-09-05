//
//  dbmanage2.swift
//  superNotepad
//
//  Created by 庞谦 on 16/8/30.
//  Copyright © 2016年 pokay. All rights reserved.
//

import Foundation

internal class dbmanage2{

    let DBFILE_NAME = "psList.sqlite3"
    var db:COpaquePointer = nil
    //获取sqlite3数据库文件位置
    func applicationDocumentsDirectoryFile() ->String {
        let  documentDirectory: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = documentDirectory[0].stringByAppendingPathComponent(DBFILE_NAME) as String
        NSLog("path : %@", path)
        return path
    }
    
    //创建一个系统配置表
    func getSysConfig()->Dictionary<String,String>{
        var theResult:Dictionary<String,String>=Dictionary<String,String>()
        let writableDBPath = self.applicationDocumentsDirectoryFile()
        let cpath = writableDBPath.cStringUsingEncoding(NSUTF8StringEncoding)
        
        if sqlite3_open(cpath!, &db) != SQLITE_OK {
            sqlite3_close(db)
            assert(false, "数据库打开失败。")
        } else {
            //创建一个系统参数配置表，有3个字段，分别是 名字、值和备注
            let sql = "CREATE TABLE IF NOT EXISTS  SysConfig (name TEXT PRIMARY KEY, value TEXT , comment TEXT)"
            let cSql = sql.cStringUsingEncoding(NSUTF8StringEncoding)
            
            if (sqlite3_exec(db,cSql!, nil, nil, nil) != SQLITE_OK) {
                sqlite3_close(db)
                assert(false, "建表失败。")
            }  
            sqlite3_close(db)  
        }  
        
        return theResult  
    }
}