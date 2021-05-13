//
//  DatabaseCURD.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-03-29.
//

import Foundation
import Firebase
class DatabaseHelper{

    
     init (){
    }
    private var  database = Database.database().reference();
    private var counter = CounterProvider.init();
    typealias completion = (_ isFinished:Int) -> Void
    func insertUser(User: User){
        let Object : [String : String] = ["firstName" : User.firstName,
                                          "lastName" : User.lastName,
                                          "BankName" : User.BankName,
                                          "userId" : User.userId,
                                          "Address" : User.Address,
                                          "phoneNumber" : User.phoneNumber,
                                          "DOB" : User.DOB,
                                          "sinNo" : User.sinNo,
                                          "EmailId" : User.EmailId,
                                          "Password" : User.Password,
                                          "DebitCardNO" : User.DebitCardNO,
                                          "CreditCardNO" : User.CreditCardNO,
                                          "SQ1" : User.SQ1,
                                          "SQ2" : User.SQ2,
                                          "SQ3" : User.SQ3,
                                          "SA1" : User.SA1,
                                          "SA2" : User.SA2,
                                          "SA3" : User.SA3,
                                          "DebitBalance" : User.DebitBalance,
                                          "CreditBalance" : User.CreditBalance           ];
        _ = counter.getUserCounter(completionHandler: { (isFinished) in if (isFinished != 0)
        {
            print("baba")
            print(isFinished)
            self.database.child("user\(isFinished)").setValue(Object);
            self.database.child("user\(isFinished)").child("transaction").child("transactionCounter").setValue(0);
            let userRef = self.database.child("counter");
            userRef.updateChildValues(["counterVal": "\(isFinished+1)"])
            self.counter.updateUserCounter(val: isFinished+1);
            print(Object);
            print(isFinished)
        }});
      }
    
    func insertTransaction(userNo : Int, transaction : Transaction){
        
        let Obj : [String : String] = [
            "TransactionID": transaction.TransactionID, "TransactionAmt": transaction.TransactionAmt, "TransactionAcc1": transaction.TransactionAcc1, "TransactionAcc2": transaction.TransactionAcc2, "DateTi": transaction.DateTi
        ];
        
        _ = counter.getTransactionCounter(userNo: userNo, completionHandler: { (isFinished) in if (isFinished != 0)
        {
            print("baba")
            print(isFinished)
            print("here we go")
            self.database.child("user\(userNo)").child("transaction").child("transaction\(isFinished)").setValue(Obj);
            self.counter.updateTransactionCounter(val: isFinished+1, userNo: userNo)
               
        }});
       
    }

    //search user Account
////    func searchTask(taskTitle : String) -> [ToDo]?{

    func searchAcc(AccNo : String, completionHandler: @escaping completion) -> Int{
        
        var val : Int = 0
        for c in 1...8 {
            database.child("user\(c)").observeSingleEvent(of: .value, with: { (snapshot) in
                let valu = snapshot.childSnapshot(forPath: "DebitCardNO").value as! String;
                if( valu == AccNo){
                    val = c;
                completionHandler(val);
                }
                if(c == 8 && val == 0){
                    completionHandler(0)
                }
        })
        }
        return val;
   }
    //search
    func searchPass(PassNo : String, completionHandler: @escaping completion) -> Int{
        
        var val : Int = 0
        for c in 1...8 {
            database.child("user\(c)").observeSingleEvent(of: .value, with: { (snapshot) in
                let valu = snapshot.childSnapshot(forPath: "Password").value as! String;
                if( valu == PassNo){
                    val = 1;
                completionHandler(val);
                }
                if(c == 8 && val == 0){
                    completionHandler(0)
                    }
        })
      }
        return val;
   }
//    //update
//    func updateTask(updatedTask: ToDo){
//        let searchResult = self.searchTask(taskID: updatedTask.id! as UUID)
//
//        if (searchResult != nil){
//            do{
//                let taskToUpdate = searchResult!
//
//                taskToUpdate.name = updatedTask.name
//                taskToUpdate.size = updatedTask.size
//                taskToUpdate.noOf = updatedTask.noOf
//
//                try self.moc.save()
//                print(#function, "Task updated successfully")
//
//            }catch let error as NSError{
//                print(#function, "Unable to search task \(error)")
//            }
//        }
//    }
//
//    //delete
//    func deleteTask(taskID : UUID)  {
//        let searchResult = self.searchTask(taskID: taskID)
//
//        if (searchResult != nil){
//            //matching record found
//            do{
//
//                self.moc.delete(searchResult!)
////                try self.moc.save()
//
//                let delegate = UIApplication.shared.delegate as! AppDelegate
//                delegate.saveContext()
//
//                print(#function, "Task deleted successfully")
//
//            }catch let error as NSError{
//                print("Unable to delete task \(error)")
//            }
//        }
//    }
//
//    //retrieve all todos
//    func getAllTodos() -> [ToDo]?{
//        let fetchRequest = NSFetchRequest<ToDo>(entityName: ENTITY_NAME)
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "dateCreated", ascending: false)]
//
//        do{
//
//            //execute the request
//            let result = try self.moc.fetch(fetchRequest)
//
//            print(#function, "Fetched data : \(result as [ToDo])")
//
////            result[0].title
//
//            //return the fetched objects after conversion to ToDo objects
//            return result as [ToDo]
//
//        }catch let error as NSError{
//            print("Could not fetch data \(error) \(error.code)")
//        }
//
//        //no data retrieved
//        return nil
//    }
//}
//
}
