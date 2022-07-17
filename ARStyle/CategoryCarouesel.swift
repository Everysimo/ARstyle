//
//  CategoryCarouesel.swift
//  ARStyle
//
//  Created by Simone Spera on 15/07/22.
//

import SwiftUI

struct CategoryCarouesel: View {
    
    @State private var index:Int = 0
    var dataArray = [0,1,2]
    
    @State var catSelection: String = "1"
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: true, content:({
//            HStack{
//                Button(action: {
//                  //self.TakeSnapshot()
//                }) {
//                  Image("ShutterButton").clipShape(Circle())
//
//                }
//                Button(action: {
//                  //self.TakeSnapshot()
//                }) {
//                  Image("ShutterButton").clipShape(Circle())
//
//                }
//            }
//        }))
        Picker(selection: $catSelection, label: Text("Data")) {
            HStack{
            Button(action: {
              //self.TakeSnapshot()
            }) {
              Image("ShutterButton").clipShape(Circle())
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 90))
            }
            Button(action: {
              //self.TakeSnapshot()
            }) {
              Image("ShutterButton").clipShape(Circle())

            }
            Button(action: {
              //self.TakeSnapshot()
            }) {
              Image("ShutterButton").clipShape(Circle())

            }
            }
        }
        .labelsHidden()
        .rotationEffect(Angle(degrees: -90))
        .frame(maxHeight: 100)
        .clipped()
        
        Picker(selection: $catSelection, label: Text("Data")) {
            ForEach(dataArray, id: \.self) { imageName in
                Image("ShutterButton")
                .clipShape(Circle())
                .scaledToFit()
                .rotationEffect(Angle(degrees: 90))
            }
        }
        .labelsHidden()
        .rotationEffect(Angle(degrees: -90))
        .frame(maxHeight: 100)
        .clipped()
    }
}

struct CategoryCarouesel_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCarouesel()
    }
}
