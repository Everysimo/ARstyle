//
//  MLModel.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import Foundation
import UIKit
import CoreML

class Predict{
    let trainedImageSize:CGSize=CGSize(width: 0, height: 0)
    
    func predictFaceShape(image: UIImage) -> String? {
        do {
            let config = MLModelConfiguration()
            let model = try FaceShapeClassifier(configuration: config)
            let pixelBuffer = toCVPixelBuffer(image: image)
            guard let prediction = try? model.prediction(image: pixelBuffer!) else {
                return nil
            }
            return prediction.classLabel
        } catch {}
        return nil
    }
    
    func predictSeasson(image: UIImage) -> String? {
        do {
            let config = MLModelConfiguration()
            let model = try PhototypeClassifier(configuration: config)
            let pixelBuffer = toCVPixelBuffer(image: image)
            guard let prediction = try? model.prediction(image: pixelBuffer!) else {
                return nil
            }
            switch prediction.classLabel {
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
        } catch {}
        return nil
    }
    
    func toCVPixelBuffer(image: UIImage) -> CVPixelBuffer? {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 299, height: 299), true, 2.0)
            image.draw(in: CGRect(x: 0, y: 0, width: 299, height: 299))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
            var pixelBuffer : CVPixelBuffer?
            let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
            guard (status == kCVReturnSuccess) else {
                return nil
            }
            
            CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
            let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
            
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
            
            context?.translateBy(x: 0, y: newImage.size.height)
            context?.scaleBy(x: 1.0, y: -1.0)
            
            UIGraphicsPushContext(context!)
            newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
            UIGraphicsPopContext()
            CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        return pixelBuffer
    }
}
