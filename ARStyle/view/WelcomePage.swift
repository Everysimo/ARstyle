//
//  WelcomePage.swift
//  ARStyle
//
//  Created by Simone Spera on 20/07/22.
//

import SwiftUI

let columns1 = [
        GridItem(.adaptive(minimum:( UIScreen.main.bounds.width/6)))
    ]
let columns2 = [
    GridItem(.adaptive(minimum:( UIScreen.main.bounds.width/3),maximum:( UIScreen.main.bounds.width/2)))
    ]
let columns4 = [
    GridItem(.adaptive(minimum:( UIScreen.main.bounds.width/4),maximum:( UIScreen.main.bounds.width/4)))
    ]

struct WelcomePage: View {
    var body: some View {
        VStack(alignment: .center, content: {
            //logo
            VStack(alignment: .center, content: {
                Image("ShutterButton").frame( alignment: .top)
                VStack{
                    Text("Discover your best look according to your Face shape with our Artificial Intelligence").multilineTextAlignment(.center).padding(.horizontal, 15.0)
                }
                //Face Shape images
                LazyVGrid(columns:columns1,
                    alignment: .center, spacing: 1) {
                    VStack(alignment: .center, spacing: 0) {
                        Image("oblong").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Oblong")
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("oval").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Oval")
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("heart").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Heart")
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("round").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Rounded")
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("square").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Square")
                    }
                }
                    .padding(.bottom, 20.0)
            })
            LazyVGrid(columns:columns2,
                alignment: .center, spacing: 2) {
                VStack{
                    Text("Try new looks with the power of Augmented Reality").multilineTextAlignment(.center)
                        .padding()
                }.frame(width: 180, height: 180)
                    .background(Color.purple)
                    .cornerRadius(15)
                LazyVGrid(columns:columns4, spacing: 2){
                    LazyHGrid(rows:columns4, spacing: 2) {
                        Image("ShutterButton").resizable()
                            .frame(width: 90.0, height: 90.0)
                        Image("ShutterButton").resizable()
                            .frame(width: 90.0, height: 90.0)
                    }
                    LazyHGrid(rows:columns4, spacing: 2) {
                        Image("ShutterButton").resizable()
                            .frame(width: 90.0, height: 90.0)
                        Image("ShutterButton").resizable()
                            .frame(width: 90.0, height: 90.0)
                    }
                }
            }.padding([.bottom, .trailing], 1)
            LazyVGrid(columns:columns2,
                alignment: .center, spacing: 2){
            LazyVGrid(columns:columns4, spacing: 2){
                LazyHGrid(rows:columns4, spacing: 2) {
                    Image("sakura").resizable()
                        .frame(width: 90.0, height: 90.0)
                    Image("sun").resizable()
                        .frame(width: 90.0, height: 90.0)
                }
                LazyHGrid(rows:columns4, spacing: 2) {
                    Image("maple-leaf").resizable()
                        .frame(width: 90.0, height: 90.0)
                    Image("snowflake").resizable()
                        .frame(width: 90.0, height: 90.0)
                }
            }.padding([.bottom, .trailing], 1)
                VStack{
                    Text("Discover your Seasonal Color Analysis").multilineTextAlignment(.center)
                        .padding()
                }.frame(width: 180, height: 180)
                    .background(Color.purple)
                    .cornerRadius(15)
        }
            Text("Upgrade your look now").multilineTextAlignment(.center).padding(.top, 25.0)
            NavigationLink("Scan your face", destination: AnalyzeView())
        })
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
