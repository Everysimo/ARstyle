//
//  ArView.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import SwiftUI
import RealityKit
import ARKit

var arView:ARView!

struct ArView: View {
    @State var propId:Int=0
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(propId:  $propId).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                CustomPicker(imgSelect: $propId)
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
        uiView.scene.anchors.removeAll()
        switch(propId){
            
            case 0:
                let arAncor = try! Glasses6.loadBlack()
                uiView.scene.anchors.append(arAncor)
            case 1:
                let arAncor = try! Glasses6.loadSpring1()
                uiView.scene.anchors.append(arAncor)
            case 2:
            let arAncor = try! Hair11.loadColor5()
                uiView.scene.anchors.append(arAncor)
            case 3:
                let arAncor = try! Hair7.loadColor25()
                uiView.scene.anchors.append(arAncor)
            case 4:
            let arAncor = try! Hair3.loadColor12()
                uiView.scene.anchors.append(arAncor)
            default:
                    break
        }
    }
}

struct ArView_Previews: PreviewProvider {
    static var previews: some View {
        ArView()
    }
}
