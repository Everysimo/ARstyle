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
    @State var offSetX:Double = 78.0
    @State var oldOffSet:Double = 78.0
    
    var body: some View {
        ZStack{
            LazyHGrid(rows: [GridItem()]){
                Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(width: 63.0, height: 63)
                        .padding(.horizontal, 5)
                Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(width: 63.0, height: 63)
                        .padding(.horizontal, 5)
                ForEach(img, id: \.self){
                    item  in
                    Image(systemName: item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 15.0)
                            .clipShape(Circle())
                            .frame(width: 63.0, height: 63.0)
                            .padding(.horizontal, 5)
                }
            }
            .offset(x: offSetX, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged { gesture in
                        if(gesture.translation.width<0){
                            if(!((imgSelect-img.count+1)==0)){
                                offSetX = offSetX - 0.5
                            }
                        }else if(gesture.translation.width>0){
                            if(!(imgSelect==0)){
                                offSetX = offSetX + 0.5
                            }
                        }
                    }
                    .onEnded {
                        gesture in
                        if(gesture.translation.width<0){
                            if(!((imgSelect-img.count+1)==0)){
                                imgSelect=imgSelect+1
                                offSetX = oldOffSet - 79
                            }
                        }else if(gesture.translation.width>0){
                            if(!(imgSelect==0)){
                                imgSelect=imgSelect-1
                                offSetX = oldOffSet + 79
                            }
                        }
                        oldOffSet=offSetX
                    }
            )
            HStack(){
                Circle().stroke(Color.red,lineWidth:3)
                    .frame(width: 63.0, height: 63.0)
                    .offset(x: /*@START_MENU_TOKEN@*/-2.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
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
