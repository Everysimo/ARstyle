//
//  MLModel.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import Foundation
import UIKit
import CoreML

extension UIImage {
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ABGR, attrs, &pixelBuffer)
        guard status == kCVReturnSuccess else {
            return nil
        }
        
        if let pixelBuffer = pixelBuffer {
            CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
            
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let context = CGContext(data: pixelData, width:  Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow:  CVPixelBufferGetBytesPerRow(pixelBuffer), space:  rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
            
            context?.translateBy(x: 0, y: self.size.height)
            context?.scaleBy(x: 1.0, y: -1.0)
            
            UIGraphicsPushContext(context!)
            self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            UIGraphicsPopContext()
            CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            
            return pixelBuffer
        }
        
        return nil
    }
}

class Predict{
    let trainedImageSize:CGSize=CGSize(width: 0, height: 0)
    
    func predictFaceShape(image: UIImage) -> String? {
        do{
            let config=MLModelConfiguration()
            let modelFaceShape=try FaceShapeClassifier(configuration: config)
            if let resizedImage = resize(image: image, newSize: trainedImageSize), let pixelBuffer = resizedImage.toCVPixelBuffer() {
                let prediction = try modelFaceShape.prediction(image: pixelBuffer).classLabel
                return prediction
            }
        } catch {
            print("Error while doing predictions: \(error)")
        }
        
        return nil
    }
    
    func predictSeasson(image: UIImage) -> String? {
        do{
            let config=MLModelConfiguration()
            let modelPhototype=try PhototypeClassifier(configuration: config)
            if let resizedImage = resize(image: image, newSize: trainedImageSize), let pixelBuffer = resizedImage.toCVPixelBuffer() {
                let prediction = try modelPhototype.prediction(image: pixelBuffer).classLabel
                switch prediction {
                    case "1-2":
                        return "Winter"
                    case "3":
                        return "Summer"
                    case "4":
                        return "Spring"
                    case "5":
                        return "Autumn"
                    case "6":
                        return "Winter"
                    default:
                        return nil
                }
            }
        } catch {
            print("Error while doing predictions: \(error)")
        }
        
        return nil
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width:  newSize.width, height: newSize.height))
        let newImage=UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
