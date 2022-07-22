//
//  ContentView.swift
//  ARStyle
//
//  Created by Simone Spera on 15/07/22.
//

import SwiftUI

struct ContentView : View {
    @StateObject var imageModel = ImageModel()
    @AppStorage("usersFirstLaunch") var userFirstLaunch:Bool = false
    
    var body: some View {
        NavigationView {
            if(userFirstLaunch){
                ArView()
            } else {
                WelcomePage()
            }
        }.environmentObject(imageModel)
    }
}




#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
