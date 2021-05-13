//
//  ViewController.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-03-29.
//

import UIKit
import FirebaseDatabase
public var viewNo: Int = 0;
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    // Var for the Corousal effect
    var BankCovers = [UIImage]();
    @IBOutlet weak var colV : UICollectionView!
    var colors = [UIColor](arrayLiteral: UIColor.blue,  UIColor.red, UIColor.orange, UIColor.green ,UIColor.white);
    var BankArr = [String](arrayLiteral: "RBC","ScotiaBank","Tangerine","TD","CIBC");
    
    let secondView = Login_Page();
    
    // Collection View Functions
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row);
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil);
//        navigationController?.title = self.BankArr[indexPath.row+1];
  //      navigationController?.navigationBar.barTintColor = UIColor.blue;
        viewNo = indexPath.row + 1;
       self.secondView.currentNO = indexPath.row + 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.BankCovers.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollView
        cell.image.image = self.BankCovers[indexPath.row];
        
        cell.bgCol.backgroundColor = self.colors[indexPath.row].withAlphaComponent(0.60);
        cell.bgCol.layer.cornerRadius = 10.0;
        cell.bgCol.layer.masksToBounds = true;
        cell.image.layer.cornerRadius = 10.0;
        cell.image.layer.masksToBounds = true;
        cell.contentView.layer.cornerRadius = 10.0;
        //cell.contentView.layer.borderWidth = 1.0;
        cell.layer.masksToBounds = true;
        return cell;
    }
    
    
    
    
    
    //View DID load specifications
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Nav_BG")!)
        let font = UIFont(name: "Helvetica", size: 22)!
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: font]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let img = UIImage(named: "Nav_GG")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
     
        // Collection View Functionality
        colV.dataSource = self;
        colV.delegate = self;
        for image in 1...5 {
           // let img = resizeImage(image: UIImage(named: "Logo_\(image)")!, targetSize: CGSize(width: 100, height: 100));
            let coffe = UIImage(named: "Logo_\(image)");
            self.BankCovers.append(coffe!);
        }
        self.colV.layer.cornerRadius = 10.0
        self.colV.layer.borderWidth = 1.0
        self.colV.layer.borderColor = UIColor.clear.cgColor
        self.colV.layer.masksToBounds = true
        
    }
    
    
    // CGRECt for image resizing
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

}


    

//import UIKit
//import Firebase
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//  var window: UIWindow?
//
//  func application(_ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions:
//      [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}
