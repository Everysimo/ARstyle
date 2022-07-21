//
//  CustomPicker.swift
//  ARStyle
//
//  Created by Daniele De Marco on 18/07/22.
//

import SwiftUI

extension Color {
  init(hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

struct CustomPicker : View {
    @AppStorage("faceShape") var faceShape:String=""
    var imgObject = ["sunglasses","long-wavy-hair-variant"]
    var imgType = [0:["1.circle.fill","2.circle.fill","3.circle.fill","4.circle.fill","5.circle.fill","6.circle.fill","7.circle.fill"],1:["1.circle.fill","2.circle.fill","3.circle.fill","4.circle.fill","5.circle.fill","6.circle.fill","7.circle.fill","8.circle.fill"]]
    var imgColor = [0:[0x424D04,0xD74524,0x71A9E1,0xD33470,0x000000,0x0E64B7,0xB32B53,0xFF7276,0x2E8D9B],1:[0xf4e9ea,0xb06500,0xe67451,0xff6700,0xc97944,0xaf8057,0xc3705f, 0xd26911, 0x9b111e, 0xdc143c,0xb73f45,0x7c2d37,0x8a4931,0xff66cc,0xe6e6fa,0xa0522d,0xc04000,0x9d7651,0x3f0fb7,0xb284be,0xde5940,0x7fffd4,0x303030,0x0e0e10,0x040720,0xfe019a,0xde5d83,0xe5e4e2,0xccff00,0x028f1e,0x89cff0,0x1a0076]]
    var p1=["Oblong": [1,5], "Oval": [3,7], "Square": [2,4], "Heart":[6,3],"unknown":[],"":[]]
    var p2=["Oblong": [3,5], "Oval": [2,7], "Square": [4,8], "Heart":[1,6],"unknown":[],"":[]]
    @Binding var object:Int
    @Binding var type:Int
    @Binding var color:Int
    @State var showingPopup:Bool=false
    @State var showingColor:Bool=false

    
    init(object: Binding<Int>, type: Binding<Int>, color: Binding<Int>){
        self._object=object
        self._type=type
        self._color=color
    }
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                if(showingColor){
                    HStack{
                        ForEach(0..<imgColor[object]!.count, id:\.self) {
                            id in
                            Button(action: {
                                color=id
                                showingColor.toggle()
                                showingPopup.toggle()
                            }){
                                Image("").resizable()
                                    .padding(7.0)
                                    .frame(width: 63.0, height: 63.0)
                                        
                            }.buttonStyle(PlainButtonStyle()).background(Color(hex: UInt(imgColor[object]![id]))).clipShape(Circle()).padding(.horizontal, 7.0)
                                .frame(width: 63.0, height: 63.0)
                        }
                    }
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                if(showingPopup){
                    HStack{
                        ForEach(0..<imgType[object]!.count, id:\.self) {
                            id in
                            Button(action: {
                                if(showingColor && type==id){
                                    showingColor.toggle()
                                }else if(!showingColor){
                                    showingColor.toggle()
                                }
                                type=id
                            }){
                                if(object==0 && p1[faceShape]!.contains(id)){
                                    Image(systemName: imgType[object]![id]).resizable()
                                        .frame(width: 63.0, height: 63.0).clipShape(Circle()).overlay(Circle().stroke(Color.yellow,lineWidth:4))
                                }else if(object==1 && p2[faceShape]!.contains(id)){
                                    Image(systemName: imgType[object]![id]).resizable()
                                        .frame(width: 63.0, height: 63.0).clipShape(Circle()).overlay(Circle().stroke(Color.yellow,lineWidth:4))
                                }else{
                                    Image(systemName: imgType[object]![id]).resizable()
                                        .frame(width: 63.0, height: 63.0)
                                }
                            }
                        }
                    }
                }
            }
            HStack{
                Spacer()
                ForEach(0..<imgObject.count, id:\.self) {
                    id in
                    Button(action: {
                        if(showingPopup && object==id){
                            if(showingColor){
                                showingColor.toggle()
                            }
                            showingPopup.toggle()
                        }else if(!showingPopup){
                            showingPopup.toggle()
                        }
                        object=id
                        
                    }){
                        Image(imgObject[id]).resizable()
                            .padding(.horizontal, 7.0)
                            .frame(width: 63.0, height: 63.0)
                    }.buttonStyle(PlainButtonStyle()).background(Color.clear)
                    Spacer()
                }
            }
        }
    }
}
