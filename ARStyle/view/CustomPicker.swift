//
//  CustomPicker.swift
//  ARStyle
//
//  Created by Daniele De Marco on 18/07/22.
//

import SwiftUI

struct CustomPicker : View {
    
    var img = ["long-wavy-hair-variant","cosmetics","sunglasses","mustache-with-beard"]

    @Binding var imgSelect:Int
    @State var offSetX:Double = 78.0
    @State var oldOffSet:Double = 78.0
    
    
    init(imgSelect:Binding<Int>){
        self._imgSelect=imgSelect
    }
    var body: some View {
        ZStack{
            LazyHGrid(rows: [GridItem()]){
                Image("glasses")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(width: 63.0, height: 63)
                        .padding(.horizontal, 5)
                Image("glasses")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 15.0)
                        .clipShape(Circle())
                        .frame(width: 63.0, height: 63)
                        .padding(.horizontal, 5)
                ForEach(img, id: \.self){
                    item  in
                    Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 15.0)
                            .clipShape(Circle())
                            .frame(width: 63.0, height: 63.0)
                            .padding(.horizontal, 5)
                }
            }
            .contentShape(Rectangle())
            .frame(height: 50)
            .offset(x: offSetX, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged { gesture in
                        if(gesture.translation.width<0){
                            if(!((imgSelect-img.count+1)==0)){
                                if((oldOffSet-79)<(offSetX-10)){
                                    offSetX = offSetX - 10
                                }
                            }
                        }else if(gesture.translation.width>0){
                            if(!(imgSelect==0)){
                                if((oldOffSet+79)>(offSetX+10)){
                                    offSetX = offSetX + 10
                                }
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
