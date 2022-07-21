//
//  ProfileView.swift
//  ARStyle
//
//  Created by Antonio Trapanese on 20/07/22.
//

import SwiftUI

struct ProfileView: View {
    var faceShape:String
    var sca:String
    init(face:String,sc:String){
         self.faceShape = face
         self.sca=sc
     }
    var season=["Winter":"Your armochromic season is winter on your face the colors with a cold, intense and bright base are perfect and colors such as white, black, raspberry red, emerald green, blue and cherry are suitable for you. \n Be careful to use warm-based colors or colors derived from orange, gold or light lies and different variations of brown","Summer":"Your armochromic season is summer on your face the colors with cold shades are perfect given your light or pink complexion for this reason the most suitable colors for you are: they are cold and clear colors but also nude, pink and delicate colors are perfect for you. \n Be careful to use colors that are too bright and light because they contrast with your natural colors","Spring":"Your armocromic season is spring on your face the colors of nature are perfect that is reborn for this colors most suitable for you are: peach, coral, but also geranium red or orange and all the warm and bright warm colors of brightness. \n Be careful to use colors with cold and dark tones, as they could make your style worse","Autumn":"Your armocromic season is autumn on your face the colors with warm and enveloping shades are perfect and for this reason the most suitable colors for you are yellow, red and orange as the color of the leaves, but you can safely use some warm nudes, peach, apricot, terracotta and brick. \n Be careful to use black or cool shades as they could make your complexion gray","unknown":"","":""]
    
    var hair=["Oblong": ["Blount Bob","Oblong1","Oblong2"],"Round":["Long Wavy Layers","Textured Lob","Round1","Round2"], "Heart": ["Bangs","Heart1","Heart2"], "Oval": ["Old Hollywood Waves", "Oval1", "Oval2"], "Square": ["Angled Bob","Curly Bob", "Long and Voluminous","Tousled Lob","Diamond1","Diamond2"],"unknown":[],"":[]]
      
    
    var beard=["Oblong": ["BOblong1","BOblong2","BOblong3"],"Round":["BRound1","BRound2","BRound3"], "Diamond": ["BDiamond1","BDiamond2","BDiamond3"], "Square": ["BSquare1","BSquare2","BSquare3"], "Heart":["BRoud1","BRound2","BRound3"],"unknown":[],"":[]]
    var body: some View {
        

        
        ScrollView{
        VStack{
            
            
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 350, height: 350, alignment: .top)
            Text("Face shape: \(faceShape)")
                .fontWeight(.medium)
            Text("Seasonal Color Analysis: \(sca)")
                .fontWeight(.medium)
            Button(action:{}){Text("Scan")
                
            }.frame(width: 150, height: 50, alignment: .center).buttonStyle(.bordered)
            
           Text("About your face Shape").bold().frame(alignment: .center)
            
            Text(face[faceShape]!)
            
            Text("About your Seasonal color analisys").bold().frame(alignment: .center)
            
            
            Text(season[sca]!)
            
            
            
            ScrollView(.horizontal){
                
                VStack{
                    Text("Hair Styles").bold().frame(alignment: .center)
                HStack{
                    ForEach(hair[faceShape]! , id:\.self){
                        immagine in
                Image(immagine)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                        
                    
                    }
                    
                }
                            
                            Section(header: Text("Beard")){
                                HStack{
                        ForEach(beard[faceShape]! , id:\.self){
                            iter in
                            Image(iter)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height:100)
                        }
                            
                        
                    }
                        
                        
                    }
                
                    

                }
                
            }
            }
            
        
        
            
            
        }.padding(.horizontal, 5.0).navigationTitle(Text("Profilo")).navigationBarTitleDisplayMode(.inline).navigationBarItems( trailing: NavigationLink("AR",destination: ArView()))
    
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(face:"Heart",sc:"Winter")
    }
}

struct StickyHeader<Content: View>: View {
var minHeight: CGFloat
var content: Content
init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
self.minHeight = minHeight
self.content = content()
}
var body: some View {
GeometryReader { geo in
if(geo.frame(in: .global).minY <= 0) {
content
.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
} else {
content
.offset(y: -geo.frame(in: .global).minY)
.frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
}
}.frame(minHeight: minHeight)
}
}




