//
//  Transaction.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-03-29.
//

import Foundation

class Transaction{
    var TransactionID : String
    var TransactionAmt : String
    var TransactionAcc1: String
    var TransactionAcc2 : String
    var DateTi : String
    init() {
       
        self.TransactionID = ""
        self.TransactionAmt = ""
        self.TransactionAcc1 = ""
        self.TransactionAcc2 = ""
        self.DateTi = ""
    }
    
    init(TransactionID : String, TransactionAmt : String, TransactionAcc1 : String, TransactionAcc2: String, DateTi : String) {
        
        self.TransactionID = TransactionID
        self.TransactionAmt = TransactionAmt
        self.TransactionAcc1 = TransactionAcc1
        self.TransactionAcc2 = TransactionAcc2
        self.DateTi = DateTi
    }

}
