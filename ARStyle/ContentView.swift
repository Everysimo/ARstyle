//
//  ContentView.swift
//  ARStyle
//
//  Created by Simone Spera on 15/07/22.
//

import SwiftUI
import RealityKit


struct ContentView : View {
    @State var propId: Int = 0
    @State var categoryId: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
          // 2
          ARViewContainer(propId: $propId,categoryId: $categoryId).edgesIgnoringSafeArea(.all)
          // 3
            VStack{
                HStack {
                    Button(action: {
                      self.propId = self.propId <= 0 ? 0 : self.propId - 1
                    }) {
                      Image("PreviousButton").clipShape(Circle())
                    }
                    Button(action: {
                      //self.TakeSnapshot()
                    }) {
                      Image("ShutterButton").clipShape(Circle())
                    }
                    Button(action: {
                      self.propId = self.propId >= 2 ? 2 : self.propId + 1
                    }) {
                      Image("NextButton").clipShape(Circle())
                    }
                }
            }
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    @Binding var propId: Int
    @Binding var categoryId: Int
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
