//
//  ImmagineModel.swift
//  ARStyle
//
//  Created by Antonio Trapanese on 20/07/22.
//

import SwiftUI
import UIKit

class ImageModel: ObservableObject {
   
    var nphoto:Int = 0
    var imageArray: [UIImage] = []
    
    func getDirectoryPath() -> NSURL {
     let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProjectImages")
    let url = NSURL(string: path)
    return url!
    }
    
    func saveImageDocumentDirectory(image: UIImage, imageName: String) {
    let fileManager = FileManager.default
    let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProjectImages")
    if !fileManager.fileExists(atPath: path) {
    try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    let url = NSURL(string: path)
    let imagePath = url!.appendingPathComponent(imageName)
    let urlString: String = imagePath!.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.5)
    //let imageData = UIImagePNGRepresentation(image)
    fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
    
    func configureDirectory() -> String {
        let fileManager = FileManager.default
    let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProject")
        if !fileManager.fileExists(atPath: path) {
        try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    return path
    }

    
    func getImageFromDocumentDirectory() {
    let fileManager = FileManager.default
    for i in 0..<nphoto {
    let imagePath = (self.getDirectoryPath() as NSURL).appendingPathComponent("picked\(i).jpg")
    let urlString: String = imagePath!.absoluteString
    if fileManager.fileExists(atPath: urlString) {
      let image = UIImage(contentsOfFile: urlString)
      imageArray.append(image!)
    } else {
    // print("No Image")
    }
    }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
