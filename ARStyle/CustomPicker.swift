//
//  CustomPicker.swift
//  ARStyle
//
//  Created by Daniele De Marco on 18/07/22.
//

import SwiftUI

struct CustomPicker : View {
    
    @State var selectedItem: Int=1
    var img = ["square.and.arrow.up","square.and.arrow.up","square.and.arrow.up"]
    
    var body: some View {
        Picker("chose a object", selection: $selectedItem){
            ForEach(img, id: \.self){
                item in
                Button(action: {
                  //self.TakeSnapshot()
                }) {
                  Image("ShutterButton").clipShape(Circle())
                }
            }
        }
        .labelsHidden()
        .pickerStyle(.wheel)
        .rotationEffect(Angle(degrees: -90))
        .clipped()
    }
}
