//
//  Bank_LoginPage.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-05-06.
//

import Foundation
import UIKit
import Combine
class Login_Page: UIViewController {
    // var declarations
    var currentNO: Int = 1
    var BankArr = [String](arrayLiteral: "RBC","ScotiaBank","Tangerine","TD","CIBC");
    var colors = [UIColor](arrayLiteral: UIColor.blue,  UIColor.red, UIColor.orange, UIColor.green ,UIColor.black);
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var userImg : UIImageView!
    @IBOutlet weak var passKey : UIImageView!
    private var previousTextFieldContent: String?
    private var previousSelection: UITextRange?
    @IBOutlet var yourTextField : UITextField!
    @IBOutlet weak var passUser : UITextField!
    @IBOutlet weak var accErr : UILabel!
    @IBOutlet weak var passErr : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        currentNO = viewNo;
        getAsthetics();
        yourTextField.addTarget(self, action: #selector(reformatAsCardNumber), for: .editingChanged)
            }
    
    
    // Function to fetch bank Logo and Asthetics
        func getAsthetics(){
            self.accErr.isHidden = true;
            self.passErr.isHidden = true;
            self.title = self.BankArr[currentNO - 1];
           // UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: font]
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: self.colors[currentNO - 1]];
            img.image = UIImage(named: "Logo_\(currentNO)");
         //   let img = UIImage(named: "User");
            
            userImg.image = UIImage(named: "User");
            userImg.image = userImg.image?.withRenderingMode(.alwaysTemplate)
            userImg.tintColor = self.colors[currentNO - 1];
            passKey.image = UIImage(named: "Pass");
            
            passKey.image = passKey.image?.withRenderingMode(.alwaysTemplate)
            passKey.tintColor = self.colors[currentNO - 1];
            yourTextField.layer.cornerRadius = 15.0
            yourTextField.layer.borderWidth = 2.0
            yourTextField.layer.borderColor = colors[currentNO - 1].cgColor
            passUser.layer.cornerRadius = 15.0
            passUser.layer.borderWidth = 2.0
            passUser.layer.borderColor = colors[currentNO - 1].cgColor
        }
    
    
    
    
    // CARD INPUT SETTER
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            previousTextFieldContent = textField.text;
            previousSelection = textField.selectedTextRange;
            return true
        }

        @objc func reformatAsCardNumber(textField: UITextField) {
            var targetCursorPosition = 0
            if let startPosition = textField.selectedTextRange?.start {
                targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
            }

            var cardNumberWithoutSpaces = ""
            if let text = textField.text {
                cardNumberWithoutSpaces = self.removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
            }

            if cardNumberWithoutSpaces.count > 16 {
                textField.text = previousTextFieldContent
                textField.selectedTextRange = previousSelection
                //textField.isUserInteractionEnabled = false;
               // textField.isUserInteractionEnabled = true;
               // refreshField();
               // validateSyncAccNo();
                print(yourTextField.text!);
                return
                  //  refreshField();
            }

            let cardNumberWithSpaces = self.insertCreditCardSpaces(cardNumberWithoutSpaces, preserveCursorPosition: &targetCursorPosition)
            textField.text = cardNumberWithSpaces

            if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
                textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
            }
        }
    func refreshField(){
        yourTextField.isUserInteractionEnabled = true;
    }
        func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
            var digitsOnlyString = ""
            let originalCursorPosition = cursorPosition

            for i in Swift.stride(from: 0, to: string.count, by: 1) {
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                if characterToAdd >= "0" && characterToAdd <= "9" {
                    digitsOnlyString.append(characterToAdd)
                }
                else if i < originalCursorPosition {
                    cursorPosition -= 1
                }
            }

            return digitsOnlyString
        }

        func insertCreditCardSpaces(_ string: String, preserveCursorPosition cursorPosition: inout Int) -> String {

            let is456 = string.hasPrefix("1")
            let is465 = [
                // Amex
                "34", "37",

                // Diners Club
                "300", "301", "302", "303", "304", "305", "309", "36", "38", "39"
            ].contains { string.hasPrefix($0) }
            let is4444 = !(is456 || is465)

            var stringWithAddedSpaces = ""
            let cursorPositionInSpacelessString = cursorPosition

            for i in 0..<string.count {
                let needs465Spacing = (is465 && (i == 4 || i == 10 || i == 15))
                let needs456Spacing = (is456 && (i == 4 || i == 9 || i == 15))
                let needs4444Spacing = (is4444 && i > 0 && (i % 4) == 0)

                if needs465Spacing || needs456Spacing || needs4444Spacing {
                    stringWithAddedSpaces.append(" ")

                    if i < cursorPositionInSpacelessString {
                        cursorPosition += 1
                    }
                }

                let characterToAdd = string[string.index(string.startIndex, offsetBy:i)]
                stringWithAddedSpaces.append(characterToAdd)
            }

            return stringWithAddedSpaces
        }
    
    // Adding Buttons Functionalities
    @IBAction func SignIN(){
        self.HideTXT();
        _ =    DatabaseHelper().searchAcc(AccNo: String(self.yourTextField.text!), completionHandler: { (success) -> Void in
        
        // When download completes,control flow goes here.
            if (success != 0) {
                print("here")
            print(success)
        } else {
            print("aah shit")
            self.throwTXTView(show: 0);
        }
    })
        _ =    DatabaseHelper().searchAcc(AccNo: String(self.yourTextField.text!), completionHandler: { (success) -> Void in
        
        // When download completes,control flow goes here.
            if (success != 0) {
        } else {
            self.throwTXTView(show: 1);
        }
    })
    }
    
    
    
    func throwTXTView(show : Int){
        if(show == 0){
            self.accErr.isHidden = false;
        }
        if(show == 1){
            self.passErr.isHidden = false;
        }
    }
    
    func HideTXT(){
            self.accErr.isHidden = true;
            self.passErr.isHidden = true;
    }
}
