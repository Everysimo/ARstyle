//
//  CameraModel.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken:Bool = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert:Bool = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    func check(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
            case .authorized:
                setUp()
            case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video){
                (status) in
                if status{
                    self.setUp()
                }
            }
            case .denied:
                self.alert.toggle()
            case .restricted:
                break
            default:
                break
        }
    }
    
    func setUp(){
        do{
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .front)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePic(){
        
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                
                withAnimation{
                    self.isTaken.toggle()
                }
            }
        }
    }
    
    func reTake(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{
                    self.isTaken.toggle()
                    
                    self.isSaved=false
                }
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        
        print("pic taken...")
        
        guard let imageData = photo.fileDataRepresentation() else {return}
        
        self.picData = imageData
    }
    
    func scanPic(image:UIImage)->(String,String){
        let mlModel=Predict()
        let faceShape=mlModel.predictFaceShape(image: image) ?? "unknown"
        let seasson=mlModel.predictSeasson(image: image) ?? "unknown"
        self.isSaved = true
        return (faceShape,seasson)
    }
}
