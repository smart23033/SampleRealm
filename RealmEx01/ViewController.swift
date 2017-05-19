//
//  ViewController.swift
//  RealmEx01
//
//  Created by 김성준 on 2017. 5. 19..
//  Copyright © 2017년 김성준. All rights reserved.
//

import UIKit
import RealmSwift

class Todo : Object {
    dynamic var title : String!
    dynamic var dueDate : Date!
}

class ViewController: UIViewController {
    
    var realm : Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        print("home : \(NSHomeDirectory())")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        add(title: "UIKit Study", due: Date())
        add(title: "Network Study", due: Date())
    }
    
    func add(title:String, due date : Date){
        let todo = Todo()
        todo.title = title
        todo.dueDate = date
        
        try! realm.write {
            realm.add(todo)
        }
    }

}

