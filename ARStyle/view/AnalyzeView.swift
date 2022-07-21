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
    @EnvironmentObject var camera:CameraModel
    @State var propId:Int=1000
    @State var photoTake=false
    @State var e=("","")
    var body: some View {
        if(!photoTake){
            ZStack(alignment: .bottom){
                ARViewContainer(propId:  $propId).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Take a selfie in a well-lit environment to analyze your face!")
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 420.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.2823529411764706, green: 0.792156862745098, blue: 0.8509803921568627)/*@END_MENU_TOKEN@*/)
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
                            .foregroundColor(Color.black)
                            .frame(width: 70.0, height: 70.0)
                            
                    }
                }
                       
            }
        } else {
            ProfileView(face: e.0, sc: e.1)
        }
    }
    func takeSnapshot(){
        arView.snapshot(saveToHDR: false){
            (image) in
            //immagine da passare ai classificatori:
            let compressedImage=UIImage(data: (image?.pngData())!)
            e=camera.scanPic(image: compressedImage!)
            photoTake.toggle()
            
            
        }
    }
}

#if DEBUG
struct AnalyzeView_Previews : PreviewProvider {
    static var previews: some View {
        AnalyzeView()
    }
}
#endif
