//
//  CellCV.swift
//  Bank-Standard
//
//  Created by Rushi Patel on 2021-05-04.
//

import Foundation
import UIKit
class CellCollView: UICollectionViewCell {
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var bgCol : UIView!
       override func awakeFromNib() {
           image.layer.cornerRadius = 5
           image.clipsToBounds = true
       }

}
