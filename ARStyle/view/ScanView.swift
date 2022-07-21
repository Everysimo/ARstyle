//
//  ScanView.swift
//  ARStyle
//
//  Created by Daniele De Marco on 21/07/22.
//

import SwiftUI
import AVFoundation

struct ScanView: View {
    @EnvironmentObject var camera:CameraModel
    var body: some View {
        ZStack{
            CameraPreview(camera: camera).ignoresSafeArea(.all, edges: .all)
            VStack{
                if camera.isTaken {
                    HStack{
                        Spacer()
                        Button(action: camera.reTake){
                            Image(systemName: "arrow.triangle.2.circlepath.camera").foregroundColor(.black).padding().background(Color.white).clipShape(Circle())
                        }
                        .padding(.leading, 10)
                    }
                }
                Spacer()
                HStack{
                    if camera.isTaken {
                        Button(action: {}){
                            Text("Scan").fontWeight(.semibold).foregroundColor(Color.black).padding(.vertical, 10.0).padding(.horizontal, 20.0).background(Color.white).clipShape(Capsule())
                        }
                        .padding(.leading)
                        Spacer()
                    } else {
                        Button(action:camera.takePic){
                            ZStack{
                                Circle().fill(Color.white).frame(width: 65.0, height: 65.0)
                                Circle().stroke(Color.white, lineWidth: 2).frame(width: 75.0, height: 75.0)
                            }
                        }
                    }

                }
                .frame(height: 75.0)
            }
        }.onAppear(perform: {
            camera.check()
        })
    }
}

struct CameraPreview: UIViewRepresentable {
    
    
    @ObservedObject var camera:CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView().environmentObject(CameraModel())
    }
}
