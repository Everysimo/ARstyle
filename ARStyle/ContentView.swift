//
//  ContentView.swift
//  ARStyle
//
//  Created by Simone Spera on 15/07/22.
//

import SwiftUI
import RealityKit
import ARKit

var arView:ARView!

struct ContentView : View {
    @State var propId:Int=0
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(propId:  $propId).edgesIgnoringSafeArea(.all)
            HStack{
                Spacer()
                Button(action: {
                    self.propId=self.propId <= 0 ? 0 : self.propId-1
                }){
                    Image(systemName:"arrowtriangle.left.fill")
                }
                Spacer()
                Button(action:{
                    self.takeSnapshot()
                }){
                    Image(systemName:"camera.shutter.button.fill")
                }
                Spacer()
                Button(action: {
                    self.propId=self.propId <= 2 ? 2 : self.propId+1
                }){
                    Image(systemName: "arrowtriangle.right.fill")
                }
                Spacer()
            }
        }
    }
    func takeSnapshot(){
        arView.snapshot(saveToHDR: false){
            (image) in
            let compressedImage=UIImage(data: (image?.pngData())!)
            UIImageWriteToSavedPhotosAlbum(compressedImage!,nil,nil,nil)
        }
    }
}


struct ARViewContainer:
    UIViewRepresentable {
    
    @Binding var propId:Int
    
    func makeUIView(context: Context) -> ARView {
        
        arView = ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let arConfiguration=ARFaceTrackingConfiguration()
        uiView.session.run(arConfiguration, options: [.resetTracking, .removeExistingAnchors])
        
        switch(propId){
            
            case 0:
            let arAncor = try! Experience.loadGlasses3black()
            uiView.scene.anchors.append(arAncor)
            default:
                break
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
