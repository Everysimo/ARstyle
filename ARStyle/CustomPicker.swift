//
//  CustomPicker.swift
//  ARStyle
//
//  Created by Daniele De Marco on 18/07/22.
//

import SwiftUI

struct CustomPicker : View {
    
    var img = ["square.and.arrow.up","square.and.arrow.down","square.and.arrow.up.on.square","square.and.arrow.down.on.square","cursorarrow.and.square.on.square.dashed"]

    @State var imgSelect:Int = 0
    
    var body: some View {
        HStack{
            switch(imgSelect){
                case 0:
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 15.0)
                    .clipShape(Circle())
                    .frame(height: 80)
                    .padding(.horizontal, 10.0)
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 15.0)
                    .clipShape(Circle())
                    .frame(height: 80)
                    .padding(.horizontal, 10.0)
                Image(systemName: img[imgSelect])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.red,lineWidth:4))
                        .padding(.horizontal, 5)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if(gesture.translation.width>0){
                                        if(!((imgSelect-img.count+1)==0)){
                                            imgSelect=imgSelect+1
                                        }
                                    }
                                }
                                .onEnded {_ in }
                        )
                case 1:
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .padding(.horizontal, 5)
                    Image(systemName: img[imgSelect-1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
                    Image(systemName: img[imgSelect])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.red,lineWidth:4))
                        .padding(.horizontal, 5)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if(gesture.translation.width>0){
                                        if(!((imgSelect-img.count+1)==0)){
                                            imgSelect=imgSelect+1
                                        }
                                    }else{
                                        imgSelect=imgSelect-1
                                    }
                                }
                                .onEnded {_ in }
                        )
                default:
                    Image(systemName: img[imgSelect-2])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
                    Image(systemName: img[imgSelect-1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
                    Image(systemName: img[imgSelect])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.red,lineWidth:4))
                        .padding(.horizontal, 5)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if(gesture.translation.width>0){
                                        if(!((imgSelect-img.count+1)==0)){
                                            imgSelect=imgSelect+1
                                        }
                                    }else{
                                        imgSelect=imgSelect-1
                                    }
                                }
                                .onEnded {_ in }
                        )
            }
            switch((imgSelect-img.count)+1){
                case 0:
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .padding(.horizontal, 5)
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .padding(.horizontal, 5)
                case -1:
                Image(systemName: img[imgSelect+1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .padding(.horizontal, 5)
                default :
                Image(systemName: img[imgSelect+1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
                Image(systemName: img[imgSelect+2])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth:4))
                        .padding(.horizontal, 5)
            }
        }
    }
}

#if DEBUG
struct CustomPicker_Previews : PreviewProvider {
    static var previews: some View {
        CustomPicker()
    }
}
#endif
