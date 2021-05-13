//
//  User.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-03-29.
//

import Foundation
class User
{
    var firstName : String;
    // To store user's first name
    var lastName : String;
    // To store user's lasr name
    var BankName : String;
    // To store user's bank's name
    var userId : String;
    // To store user's id
    var Address : String;
    // To store user's Addrerss
    var phoneNumber : String;
    // To store user's phone Number
    var DOB : String;
    // To store user's Date of birth
    var sinNo : String;
    // To store user's Social Insurance Number (hypothetical)
    var EmailId : String;
    // To store user's Email Id
    var Password : String;
    // To store user's Password
    var DebitCardNO : String;
    // To store user's Debit card no
    var CreditCardNO : String;
    // To store user's Credit card no
    var SQ1 : String;
    // To store user's Security Question
    var SQ2 : String;
    // To store user's Security Question
    var SQ3 : String;
    // To store user's Security Question
    var SA1 : String;
    // To store user's Security Answer
    var SA2 : String;
    // To store user's Security Answer
    var SA3 : String;
    // To store user's Security Answer
    var DebitBalance : String;
    // To store user's Debit Balance
    var CreditBalance : String;
    // To store user's CreditBalance
    var transaction : Transaction;
    
    init() {
        self.firstName = "";
        self.lastName = "";
        self.BankName = "";
        self.userId = "";
        self.Address = "";
        self.phoneNumber = "";
        self.DOB = "";
        self.sinNo = "";
        self.EmailId = "";
        self.Password = "";
        self.DebitCardNO = "";
        self.CreditCardNO = "";
        self.SQ1 = "";
        self.SQ2 = "";
        self.SQ3 = "";
        self.SA1 = "";
        self.SA2 = "";
        self.SA3 = "";
        self.DebitBalance = "";
        self.CreditBalance = "";
        self.transaction = Transaction.init()
    }
    
    init(
        firstName : String,
        lastName : String,
        BankName : String,
        userId : String,
        Address : String,
        phoneNumber : String,
        DOB : String,
        sinNo : String,
        EmailId : String,
        Password : String,
        DebitCardNO : String,
        CreditCardNO : String,
        SQ1 : String,
        SQ2 : String,
        SQ3 : String,
        SA1 : String,
        SA2 : String,
        SA3 : String,
        DebitBalance : String,
        CreditBalance : String,
        transaction : Transaction) {
        
        self.firstName = firstName;
        self.lastName = lastName;
        self.BankName = BankName;
        self.userId = userId;
        self.Address = Address;
        self.phoneNumber = phoneNumber;
        self.DOB = DOB;
        self.sinNo = sinNo;
        self.EmailId = EmailId;
        self.Password = Password;
        self.DebitCardNO = DebitCardNO;
        self.CreditCardNO = CreditCardNO;
        self.SQ1 = SQ1;
        self.SQ2 = SQ2;
        self.SQ3 = SQ3;
        self.SA1 = SA1;
        self.SA2 = SA2;
        self.SA3 = SA3;
        self.DebitBalance = DebitBalance;
        self.CreditBalance = CreditBalance;
        self.transaction = transaction;
    }
}
