//
//  ViewController.swift
//  superNotepad
//
//  Created by 庞谦 on 16/8/30.
//  Copyright © 2016年 pokay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func BtCreateTable(sender: AnyObject){
        let dbm2 = dbmanage2()
        
        var x=dbm2.getSysConfig()
        
        
        
        //let dbm = dbmanage()
        //dbm.createTableTest()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

