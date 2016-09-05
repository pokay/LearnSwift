//
//  ViewController.swift
//  TryConnSQLite3
//
//  Created by 庞谦 on 16/9/2.
//  Copyright © 2016年 pokay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPwd: UITextField!
    
    
    var db : SQLiteDB!
    
    
    @IBAction func btnReg(sender: AnyObject) {
        saveUser()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance
        
        //如果表不存在就创建，存在则不创建
        db.execute("create table if not exists users(uid integer primary key,username varchar(20),pwd varchar(20))")
        
        //如果有数据则加载
        initUser()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func saveUser(){
        let uname = self.txtUserName.text!
        let pwd = self.txtPwd.text!
        
        let sql = "insert into users(username,pwd) values('\(uname)','\(pwd)')"
        print ("sql:\(sql)")
        
        let result = db.execute(sql)
        print (result)
    }
    
    func initUser(){
      let data = db.query("select * from users order by uid asc")
        if data.count > 0 {
        
        let user = data[data.count-1]
            txtUserName.text = user["username"] as? String
            txtPwd.text = user["pwd"] as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

