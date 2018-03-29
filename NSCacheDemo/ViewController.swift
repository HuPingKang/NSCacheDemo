//
//  ViewController.swift
//  NSCacheDemo
//
//  Created by qwer on 2018/3/29.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.contentLabel.text = Cache.shared.getCacheValue("10") ?? "未找到对应value"
        
    }

    @IBAction func save(_ sender: Any) {
        
        let count = self.textFiled.text?.count ?? 0
        if count > 0{
            Cache.shared.setCacheValue(self.textFiled.text!, [self.textFiled.text!:"\(self.textFiled.text!)===\(self.textFiled.text!)"])
        }

    }
    
    @IBAction func read(_ sender: Any) {
        
        self.contentLabel.text = Cache.shared.getCacheValue(self.textFiled.text!) ?? "未找到对应value"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

