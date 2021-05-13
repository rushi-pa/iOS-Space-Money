//
//  CounterProvider.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-03-30.
//

import Foundation
import Firebase
class CounterProvider{
    
    typealias completion = (_ isFinished:Int) -> Void

    private var  database = Database.database().reference();
    init(){}
    func getUserCounter(completionHandler: @escaping completion) -> Int{
        var val : Int = 0
        //try completion
        database.child("counter").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let valu = snapshot.childSnapshot(forPath: "counterVal").value as! String
          //  print("here")
            
           
           // print(valu)
            //  let username = value?["counterVal"] as? String ?? ""
          val = Int(valu) ?? 0
            //print(val)
            completionHandler(val);
        })
        
        return val;
       // return val;
    }
    
    
    func updateUserCounter(val : Int) {
        let userRef = database.child("counter");
        userRef.updateChildValues(["counterVal": "\(val)"]);
    }
    
    
    func getTransactionCounter(userNo : Int,completionHandler: @escaping completion) -> Int{
        var val = 0;
        database.child("user\(userNo)").child("transaction").child("transactionCounter").observeSingleEvent(of: .value, with: { (snapshot) in //guard snapshot.exists() != false else { return}
          // Get user value
            print(snapshot.value!)
          let value = snapshot.value as! String
          val = Int(value) ?? 0
            print(val);
            completionHandler(val);
          }
        ) { (error) in
            print(error.localizedDescription)
        }
        return val;
    }
  
    
    func updateTransactionCounter(val : Int, userNo :Int){
        
        let userRef = database.child("user\(userNo)").child("transaction");
        userRef.updateChildValues(["transactionCounter": "\(val)"]);
    }
}
