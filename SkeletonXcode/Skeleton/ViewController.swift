//
//  ViewController.swift
//  Skeleton
//
//  Created by JingyiZhang on 12/11/17.
//  Copyright © 2017 jz. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testdata()
        testquery()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testdata(){
    
        let US = Test1()
        US.Year = "1996"
        US.M = 66666
        US.Z = 55555
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(US)
            print("Added \(US.Year) to realm")
        }
    }
    
    func testquery(){
        
        let realm = try! Realm()
        
        let alldata = realm.objects(Test1.self)
        //alldata.count
        for i in alldata{
            print("import \(i.M) export \(i.Z)")
        }
        
    }
}

