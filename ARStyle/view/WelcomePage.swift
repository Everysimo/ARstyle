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
                VStack{
                    Text("Discover your best look according to your Face shape with our Artificial Intelligence").multilineTextAlignment(.center).padding(.horizontal, 15.0).foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                        .font(.system(size: 17, weight: .bold, design: .default))
                }.frame(width: .infinity, height: 80)
                    .background(Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255))
                    .cornerRadius(15)
    
                //Face Shape images
                LazyVGrid(columns:columns1,
                    alignment: .center, spacing: 1) {
                    VStack(alignment: .center, spacing: 0) {
                        Image("oblong").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Oblong")
                            .foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("oval").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Oval").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("heart").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Heart").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("round").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Rounded").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Image("square").resizable()
                            .frame(width: 70.0, height: 70.0)
                        Text("Square").foregroundColor(Color(red: 36 / 255, green: 64 / 255, blue: 61 / 255))
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                }
                    .padding(.bottom, 20.0)
            })
            .padding(.horizontal)
            
            LazyVGrid(columns:columns2,
                alignment: .center, spacing: 2) {
                VStack{
                    Text("Try new looks with the power of Augmented Reality").multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .font(.system(size: 20, weight: .bold, design: .default))
                }.frame(width: 180, height: 180)
                    .background(Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255))
                    .cornerRadius(15)
                LazyVGrid(columns:columns4, spacing: 2){
                    LazyHGrid(rows:columns4, spacing: 2) {
                        Image("long-wavy-hair-variant").resizable()
                            .frame(width: 90.0, height: 90.0)
                        Image("cosmetics").resizable()
                            .frame(width: 90.0, height: 90.0)
                    }
                    LazyHGrid(rows:columns4, spacing: 2) {
                        Image("sunglasses").resizable()
                            .frame(width: 90.0, height: 90.0)
                        Image("mustache-with-beard").resizable()
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
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                }.frame(width: 180, height: 180)
                    .background(Color(red: 72 / 255, green: 202 / 255, blue: 217 / 255))
                    .cornerRadius(15)
        }
            Text("Upgrade your look now").multilineTextAlignment(.center).padding()
                .font(.system(size: 25, weight: .bold, design: .rounded))
            Button(action: {
            }) {
                NavigationLink( destination: AnalyzeView()) {
                Text("Scan your face")
                }
            }.buttonStyle(.bordered)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                .background(Color(red: 3 / 255, green: 127 / 255, blue: 140 / 255))
        }).frame(width: .infinity, height: .infinity)
            .navigationTitle(Text("About the app")).navigationBarTitleDisplayMode(.inline).navigationBarItems( trailing: NavigationLink("Scan",destination: AnalyzeView()))
        }
    }


struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
