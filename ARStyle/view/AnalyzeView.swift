//
//  ContentView.swift
//  ARStyle
//
//  Created by Simone Spera on 15/07/22.
//

import SwiftUI
import RealityKit
import ARKit

struct AnalyzeView : View {
    var camera=CameraModel()
    @Environment(\.dismiss) var dismiss
    @State var object:Int=1000
    var body: some View {
            ZStack(alignment: .bottom){
                ARViewContainer(object:  $object, type: $object, color: $object).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Keep your head in the circle and take a photo")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .frame(width: 420.0)
                        .padding()
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .background(Color(red: 3 / 255, green: 127 / 255, blue: 140 / 255))
                    
                    Spacer()
                    Ellipse()
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [3,  20]))
                        .frame(width: 300, height: 450)
                    Spacer()
                        Button(action:{
                            self.takeSnapshot()
                        }){
                            Image(systemName: "camera.circle")
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color.white)
                                .frame(width: 70.0, height: 70.0)
                                
                        }
                
                }
                       
            }
    }
    func takeSnapshot(){
        arView.snapshot(saveToHDR: false){
            (image) in
            //immagine da passare ai classificatori:
            let compressedImage=UIImage(data: (image?.pngData())!)
            let e=camera.scanPic(image: compressedImage!)
            UserDefaults.standard.set(e.0, forKey: "faceShape")
            UserDefaults.standard.set(e.1, forKey: "seasson")
            UserDefaults.standard.set(true, forKey: "usersFirstLaunch")
            
        }
        dismiss()
    }
    func skip(){
        UserDefaults.standard.set("unknown", forKey: "faceShape")
        UserDefaults.standard.set("unknown", forKey: "seasson")
        UserDefaults.standard.set(true, forKey: "usersFirstLaunch")
    }
}

#if DEBUG
struct AnalyzeView_Previews : PreviewProvider {
    static var previews: some View {
        AnalyzeView()
    }
}
#endif
