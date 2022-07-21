//
//  PreferencesPage.swift
//  ARStyle
//
//  Created by Simone Spera on 21/07/22.
//

import SwiftUI

let columns3 = [
    GridItem(.adaptive(minimum:( (UIScreen.main.bounds.width+15)/4),maximum:( (UIScreen.main.bounds.width+15)/4)))
    ]


struct PreferencesPage: View {
    @State private var sH:Bool = false
    @State private var mH:Bool = false
    @State private var lH:Bool = false
    @State private var sB:Bool = false
    @State private var mB:Bool = false
    @State private var lB:Bool = false
    @State private var sA:Bool = false
    @State private var mA:Bool = false
    @State private var lA:Bool = false
    
    var body: some View {
        ZStack(alignment: .top, content: {
            VStack(alignment: .center, content: {
                Text("Your Preferences").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                    .font(.system(size: 25, weight: .bold, design: .default))
                VStack(alignment: .center, content: {
                    Text("Hairs").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                        .font(.system(size: 18, weight: .bold, design: .default))
                    LazyVGrid(columns: columns3, alignment: .center) {
                        VStack(alignment: .center, content: {
                            if(!sH){
                                Image("short-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            sH.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("short-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            sH.toggle()
                                        }
                                    }
                            }
                            Text("Short")
                        })
                        .padding(.trailing)
                        VStack(alignment: .center, content: {
                            if(!mH){
                                Image("mid-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            mH.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("mid-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            mH.toggle()
                                        }
                                    }
                            }
                            Text("Mid")
                        })
                        .padding(.horizontal)
                        VStack(alignment: .center, content: {
                            if(!lH){
                                Image("long-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            lH.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("long-hair")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            lH.toggle()
                                        }
                                    }
                            }
                            Text("Long")
                        })
                        .padding(.leading)
                    }
                })
                VStack(alignment: .center, content: {
                    Text("Beard").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                        .font(.system(size: 18, weight: .bold, design: .default))
                    LazyVGrid(columns: columns3, alignment: .center) {
                        VStack(alignment: .center, content: {
                            if(!sB){
                                Image("no-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            sB.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("no-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            sB.toggle()
                                        }
                                    }
                            }
                            Text("No Beard")
                        })
                        .padding(.trailing)
                        VStack(alignment: .center, content: {
                            if(!mB){
                                Image("short-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            mB.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("short-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            mB.toggle()
                                        }
                                    }
                            }
                            Text("Short")
                        })
                        .padding(.horizontal)
                        VStack(alignment: .center, content: {
                            if(!lB){
                                Image("long-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            lB.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("long-beard")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            lB.toggle()
                                        }
                                    }
                            }
                            Text("Long")
                        })
                        .padding(.leading)
                    }
                })
                VStack(alignment: .center, content: {
                    Text("Accessories").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                        .font(.system(size: 18, weight: .bold, design: .default))
                    LazyVGrid(columns: columns3, alignment: .center){
                        VStack(alignment: .center, content: {
                            if(!sA){
                                Image("glassess")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            sA.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("glassess")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            sA.toggle()
                                        }
                                    }
                            }
                            Text("Glasses")
                        })
                        .padding(.trailing)
                        VStack(alignment: .center, content: {
                            if(!mA){
                                Image("makeup")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            mA.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("makeup")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            mA.toggle()
                                        }
                                    }
                            }
                            Text("Make-up")
                        })
                        .padding(.horizontal)
                        VStack(alignment: .center, content: {
                            if(!lA){
                                Image("piercing")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .grayscale(0.99)
                                    .onTapGesture {
                                        withAnimation {
                                            lA.toggle()
                                        }
                                    }
                            }
                            else{
                                Image("piercing")
                                    .resizable()
                                    .frame(width: 115, height: 165)
                                    .cornerRadius(15)
                                    .shadow(color: Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255), radius:4, x: 4, y: 4)
                                    .onTapGesture {
                                        withAnimation {
                                            lA.toggle()
                                        }
                                    }
                            }
                            Text("Piercing")
                        })
                        .padding(.leading)
                    }
                })
            })
        }).frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

struct PreferencesPage_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesPage()
    }
}
