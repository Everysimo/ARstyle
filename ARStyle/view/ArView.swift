//
//  ArView.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import SwiftUI
import RealityKit
import ARKit
import PencilKit

var arView:ARView!

struct ArView: View {
    @EnvironmentObject private var imageModel: ImageModel
    @State var object:Int=0
    @State var type:Int=0
    @State var color:Int=0
    var canvasView = PKCanvasView()
    var body: some View {
        ZStack(alignment: .bottom){
            
//            if(object==1){
//                ARViewContainer2(canvasView: canvasView)
//                    .edgesIgnoringSafeArea(.all)
//            }else {
                ARViewContainer(object:  $object, type: $type, color: $color).edgesIgnoringSafeArea(.all)
//            }
            VStack{
                Spacer()
                CustomPicker(object: $object, type: $type, color: $color)
                    
                Button(action:{
                    self.takeSnapshot()
                }){
                    Image(systemName: "camera.circle")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(Color.white)
                        .frame(width: 70.0, height: 70.0)
                        
                }
                .padding(.top, 10.0)
            }
        }.navigationBarItems(leading: NavigationLink("profile",destination: ProfileView()) ,trailing: NavigationLink("makeup",destination: MakeUpView()))
    }
    func takeSnapshot(){
        arView.snapshot(saveToHDR: false){
            (image) in
            let compressedImage=UIImage(data: (image?.pngData())!)
            imageModel.saveImageDocumentDirectory(image: compressedImage!)
        }
    }
}

struct ARViewContainer:
    UIViewRepresentable {

    @Binding var object:Int
    @Binding var type:Int
    @Binding var color:Int
    
    func makeUIView(context: Context) -> ARView {
        
        arView = ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let arConfiguration=ARFaceTrackingConfiguration()
        uiView.session.run(arConfiguration, options: [.resetTracking, .removeExistingAnchors])
        uiView.scene.anchors.removeAll()
        switch(object){
            
            case 0:
            switch(type){
                
                case 0:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses1.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses1.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses1.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses1.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses1.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses1.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses1.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses1.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses1.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 1:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses2.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses2.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses2.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses2.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses2.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses2.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses2.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses2.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses2.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 2:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses3.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses3.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses3.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses3.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses3.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses3.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses3.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses3.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses3.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 3:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses4.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses4.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses4.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses4.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses4.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses4.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses4.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses4.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses4.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 4:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses5.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses5.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses5.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses5.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses5.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses5.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses5.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses5.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses5.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 5:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses6.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses6.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses6.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses6.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses6.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses6.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses6.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses6.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses6.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                case 6:
                    switch(color){
                        
                        case 0:
                            let arAncor = try! Glasses7.loadAutumn1()
                            uiView.scene.anchors.append(arAncor)
                        case 1:
                            let arAncor = try! Glasses7.loadAutumn2()
                            uiView.scene.anchors.append(arAncor)
                        case 2:
                            let arAncor = try! Glasses7.loadSummer1()
                            uiView.scene.anchors.append(arAncor)
                        case 3:
                            let arAncor = try! Glasses7.loadSummer2()
                            uiView.scene.anchors.append(arAncor)
                        case 4:
                            let arAncor = try! Glasses7.loadBlack()
                            uiView.scene.anchors.append(arAncor)
                        case 5:
                            let arAncor = try! Glasses7.loadWinter1()
                            uiView.scene.anchors.append(arAncor)
                        case 6:
                            let arAncor = try! Glasses7.loadWinter2()
                            uiView.scene.anchors.append(arAncor)
                        case 7:
                            let arAncor = try! Glasses7.loadSpring1()
                            uiView.scene.anchors.append(arAncor)
                        case 8:
                            let arAncor = try! Glasses7.loadSpring2()
                            uiView.scene.anchors.append(arAncor)
                        default:
                                break
                    }
                default:
                        break
            }
            case 1:
                switch(type){
                    
                    case 0:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair1.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair1.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair1.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair1.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair1.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair1.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair1.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair1.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair1.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair1.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair1.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair1.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair1.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair1.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair1.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair1.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair1.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair1.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair1.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair1.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair1.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair1.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair1.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair1.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair1.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair1.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair1.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair1.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair1.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair1.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair1.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair1.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair1.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 1:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair2.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair2.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair2.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair2.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair2.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair2.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair2.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair2.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair2.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair2.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair2.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair2.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair2.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair2.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair2.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair2.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair2.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair2.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair2.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair2.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair2.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair2.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair2.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair2.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair2.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair2.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair2.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair2.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair2.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair2.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair2.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair2.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair2.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 2:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair3.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair3.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair3.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair3.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair3.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair3.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair3.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair3.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair3.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair3.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair3.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair3.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair3.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair3.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair3.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair3.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair3.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair3.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair3.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair3.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair3.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair3.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair3.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair3.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair3.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair3.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair3.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair3.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair3.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair3.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair3.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair3.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair3.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 3:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair4.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair4.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair4.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair4.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair4.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair4.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair4.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair4.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair4.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair4.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair4.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair4.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair4.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair4.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair4.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair4.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair4.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair4.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair4.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair4.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair4.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair4.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair4.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair4.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair4.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair4.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair4.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair4.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair4.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair4.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair4.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair4.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair4.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 4:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair7.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair7.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair7.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair7.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair7.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair7.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair7.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair7.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair7.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair7.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair7.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair7.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair7.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair7.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair7.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair7.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair7.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair7.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair7.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair7.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair7.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair7.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair7.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair7.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair7.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair7.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair7.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair7.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair7.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair7.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair7.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair7.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair7.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 5:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair8.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair8.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair8.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair8.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair8.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair8.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair8.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair8.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair8.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair8.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair8.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair8.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair8.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair8.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair8.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair8.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair8.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair8.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair8.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair8.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair8.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair8.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair8.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair8.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair8.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair8.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair8.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair8.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair8.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair8.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair8.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair8.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair8.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 6:
                        switch(color){
                            
                            case 0:
                            let arAncor = try! Hair9.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair9.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair9.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair9.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair9.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair9.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair9.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair9.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair9.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair9.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair9.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair9.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair9.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair9.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair9.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair9.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair9.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair9.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair9.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair9.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair9.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair9.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair9.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair9.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair9.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair9.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair9.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair9.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair9.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair9.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair9.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair9.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair9.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    case 7:
                        switch(color){
                            
                            case 0:
                                let arAncor = try! Hair11.loadColor1()
                                uiView.scene.anchors.append(arAncor)
                            case 1:
                                let arAncor = try! Hair11.loadColor2()
                                uiView.scene.anchors.append(arAncor)
                            case 2:
                                let arAncor = try! Hair11.loadColor3()
                                uiView.scene.anchors.append(arAncor)
                            case 3:
                                let arAncor = try! Hair11.loadColor4()
                                uiView.scene.anchors.append(arAncor)
                            case 4:
                                let arAncor = try! Hair11.loadColor5()
                                uiView.scene.anchors.append(arAncor)
                            case 5:
                                let arAncor = try! Hair11.loadColor6()
                                uiView.scene.anchors.append(arAncor)
                            case 6:
                                let arAncor = try! Hair11.loadColor7()
                                uiView.scene.anchors.append(arAncor)
                            case 7:
                                let arAncor = try! Hair11.loadColor8()
                                uiView.scene.anchors.append(arAncor)
                            case 8:
                                let arAncor = try! Hair11.loadColor9()
                                uiView.scene.anchors.append(arAncor)
                            case 9:
                                let arAncor = try! Hair11.loadColor10()
                                uiView.scene.anchors.append(arAncor)
                            case 10:
                                let arAncor = try! Hair11.loadColor11()
                                uiView.scene.anchors.append(arAncor)
                            case 11:
                                let arAncor = try! Hair11.loadColor12()
                                uiView.scene.anchors.append(arAncor)
                            case 12:
                                let arAncor = try! Hair11.loadColor13()
                                uiView.scene.anchors.append(arAncor)
                            case 13:
                                let arAncor = try! Hair11.loadColor14()
                                uiView.scene.anchors.append(arAncor)
                            case 14:
                                let arAncor = try! Hair11.loadColor15()
                                uiView.scene.anchors.append(arAncor)
                            case 15:
                                let arAncor = try! Hair11.loadColor16()
                                uiView.scene.anchors.append(arAncor)
                            case 16:
                                let arAncor = try! Hair11.loadColor17()
                                uiView.scene.anchors.append(arAncor)
                            case 17:
                                let arAncor = try! Hair11.loadColor18()
                                uiView.scene.anchors.append(arAncor)
                            case 18:
                                let arAncor = try! Hair11.loadColor19()
                                uiView.scene.anchors.append(arAncor)
                            case 19:
                                let arAncor = try! Hair11.loadColor20()
                                uiView.scene.anchors.append(arAncor)
                            case 20:
                                let arAncor = try! Hair11.loadColor21()
                                uiView.scene.anchors.append(arAncor)
                            case 21:
                                let arAncor = try! Hair11.loadColor22()
                                uiView.scene.anchors.append(arAncor)
                            case 22:
                                let arAncor = try! Hair11.loadColor23()
                                uiView.scene.anchors.append(arAncor)
                            case 23:
                                let arAncor = try! Hair11.loadColor24()
                                uiView.scene.anchors.append(arAncor)
                            case 24:
                                let arAncor = try! Hair11.loadColor25()
                                uiView.scene.anchors.append(arAncor)
                            case 25:
                                let arAncor = try! Hair11.loadColor26()
                                uiView.scene.anchors.append(arAncor)
                            case 26:
                                let arAncor = try! Hair11.loadColor27()
                                uiView.scene.anchors.append(arAncor)
                            case 27:
                                let arAncor = try! Hair11.loadColor28()
                                uiView.scene.anchors.append(arAncor)
                            case 28:
                                let arAncor = try! Hair11.loadColor29()
                                uiView.scene.anchors.append(arAncor)
                            case 29:
                                let arAncor = try! Hair11.loadColor30()
                                uiView.scene.anchors.append(arAncor)
                            case 30:
                                let arAncor = try! Hair11.loadColor31()
                                uiView.scene.anchors.append(arAncor)
                            case 31:
                                let arAncor = try! Hair11.loadColor32()
                                uiView.scene.anchors.append(arAncor)
                            case 32:
                                let arAncor = try! Hair11.loadColor33()
                            uiView.scene.anchors.append(arAncor)
                            default:
                                break
                        }
                    default:
                            break
                }
            default:
                    break
        }
    }
}

struct ArView_Previews: PreviewProvider {
    static var previews: some View {
        ArView().environmentObject(ImageModel())
    }
}
