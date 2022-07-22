//
//  CameraModel.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraModel{
    
    @Published var isSaved = false
    
    func scanPic(image:UIImage)->(String,String){
        let mlModel=Predict()
        let faceShape=mlModel.predictFaceShape(image: image) ?? "unknown"
        let seasson=mlModel.predictSeasson(image: image) ?? "unknown"
        self.isSaved = true
        return (faceShape,seasson)
    }
}
