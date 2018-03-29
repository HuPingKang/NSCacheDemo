//
//  Cache.swift
//  NSCacheDemo
//
//  Created by qwer on 2018/3/29.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class Cache: NSObject {
    
    static let shared = Cache()
    
    private var imCache = NSCache<NSString,NSDictionary>()
    
    func setCacheValue(_ key:String,_ value:NSDictionary){
        
        //一级缓存：
        self.imCache.setObject(value, forKey: key as NSString)
        
        //二级缓存；
        let url = self.saveFilePath(key)
        try? value.write(to: url)
        
    }
    
    
    func getCacheValue(_ key:String)->String?{
        
        guard let valueDix = self.imCache.object(forKey: key as NSString) else {
            
            let url = self.saveFilePath(key)
            
            guard let value =  NSDictionary.init(contentsOf: url)?.value(forKey: key) as? String else {
                
                return nil
                
                
            }
            
            return value
            
        }
        
        return valueDix.object(forKey: key) as? String
        
        
    }
    
    private func saveFilePath(_ key:String)->URL{
        
        var path:String = NSHomeDirectory() + "/Library/Caches/"
        path.append("\(key)/")
        
        if FileManager.default.fileExists(atPath: path) == false {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: [:])
        }
        
        let url = URL.init(fileURLWithPath: path)
        
        return url
        
    }
    

}
