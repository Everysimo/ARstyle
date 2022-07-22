//
//  ProfileView.swift
//  ARStyle
//
//  Created by Antonio Trapanese on 20/07/22.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("faceShape") var faceShape:String=""
    @AppStorage("seasson") var sca:String=""
    var face = ["Square":"This face develops to a similar extent both in height and in width. Those with a square (or square) face have a rather narrow and elongated shape: the forehead is high and the chin pronounced while the nose could be longer than average and the cheekbones rather flat. The square face with the passing of the years does not lose the oval, so it is less noticeable as the years go by.", "Round":"The round face is one of the easiest to recognize: the line of its outline forms an almost perfect circle, the oval is not angular, the cheeks are full and the cheekbones are rounded and never in evidence. Width and length are the same, with a usually very wide forehead. The ideal, for this type of face shape, is a defined make-up as well as a haircut. If on the one hand round and full faces have the advantage of looking younger, on the other hand the biggest 'defect' is the lack of definition and never as in the case of the round face, it will be useful to contour.", "Heart":"large forehead, pointed chin and prominent cheekbones. The only difference is that while the heart shape has a heart-shaped hairline, the inverted triangle face has a V-shaped one.In the heart-shaped face, the cheeks are emptied and the jaw receding, so the main objective will be to rebalance the lower part of the face, which is smaller, with the upper one that is wider.", "Oval":"The oval face, as the name already suggests, is longer than it is wide. The eyes have a distance from the hairline that is equal to the distance from the tip of the nose to the chin. Usually, those with an oval face will notice how the shape becomes wider at the cheeks. One of the biggest benefits of having an oval shaped face is being able to choose any type of cut as practically all styles will fit well.", "Oblong":"The oblong face develops much more in height, in some respects it is very similar to the oval-shaped one, but characterized by flat cheekbones and a very thin face overall. It needs to be visually shortened and filled in to rebalance the harmony of the various parts.","unknown":"","":""]
    
    var season=["Winter":"Your armochromic season is winter on your face the colors with a cold, intense and bright base are perfect and colors such as white, black, raspberry red, emerald green, blue and cherry are suitable for you. \n Be careful to use warm-based colors or colors derived from orange, gold or light lies and different variations of brown","Summer":"Your armochromic season is summer on your face the colors with cold shades are perfect given your light or pink complexion for this reason the most suitable colors for you are: they are cold and clear colors but also nude, pink and delicate colors are perfect for you. \n Be careful to use colors that are too bright and light because they contrast with your natural colors","Spring":"Your armocromic season is spring on your face the colors of nature are perfect that is reborn for this colors most suitable for you are: peach, coral, but also geranium red or orange and all the warm and bright warm colors of brightness. \n Be careful to use colors with cold and dark tones, as they could make your style worse","Autumn":"Your armocromic season is autumn on your face the colors with warm and enveloping shades are perfect and for this reason the most suitable colors for you are yellow, red and orange as the color of the leaves, but you can safely use some warm nudes, peach, apricot, terracotta and brick. \n Be careful to use black or cool shades as they could make your complexion gray","unknown":"","":""]
    
    var hair=["Oblong": ["Blount Bob","Oblong1","Oblong2"],"Round":["Long Wavy Layers","Textured Lob","Round1","Round2"], "Heart": ["Bangs","Heart1","Heart2"], "Oval": ["Old Hollywood Waves", "Oval1", "Oval2"], "Square": ["Angled Bob","Curly Bob", "Long and Voluminous","Tousled Lob","Diamond1","Diamond2"],"unknown":[],"":[]]
      
    
    var beard=["Oblong": ["BOblong1","BOblong2","BOblong3"],"Round":["BRound1","BRound2","BRound3"], "Oval": ["BDiamond1","BDiamond2","BDiamond3"], "Square": ["BSquare1","BSquare2","BSquare3"], "Heart":["BRoud1","BRound2","BRound3"],"unknown":[],"":[]]
    
    @State private var isExp1:Bool = false
    @State private var isExp2:Bool = false
    
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
            Button(action: {
            }) {
                NavigationLink( destination: AnalyzeView()) {
                Text("Scan your face")
                }
            }.buttonStyle(.bordered)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                .background(Color(red: 3 / 255, green: 127 / 255, blue: 140 / 255))
            
            DisclosureGroup("About your face Shape",isExpanded: $isExp1) {
                VStack{
                    Text(face[faceShape]!)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }.foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                .background(Color(red: 3 / 255, green: 127 / 255, blue: 140 / 255))
                .accentColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .cornerRadius(8)
                    .padding(.horizontal, 5.0)
            
            DisclosureGroup("About your Seasonal color analisys",isExpanded: $isExp2) {
                VStack{
                    Text(season[sca]!)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }.foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                .background(Color(red: 3 / 255, green: 127 / 255, blue: 140 / 255))
                .accentColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .cornerRadius(8)
                    .padding(.horizontal, 5.0)
            
            ScrollView(.vertical){
                VStack{
                    Text("Hair Styles").bold().frame(alignment: .center)
                    ScrollView(){
                        HStack{
                            ForEach(hair[faceShape]! , id:\.self){
                                immagine in
                        Image(immagine)
                            .resizable()
                            .frame(width: 100, height: 120)
                            }
                        }
                    }
                            Section(header: Text("Beard")){
                                HStack{
                        ForEach(beard[faceShape]! , id:\.self){
                            iter in
                            Image(iter)
                                .resizable()
                                .frame(width: 100, height: 120)
                        }
                    }
                }
            }
            }
            
        }.padding(.horizontal, 5.0).navigationTitle(Text("Profilo")).navigationBarTitleDisplayMode(.inline).navigationBarItems(trailing: NavigationLink("Gallery",destination: GalleryView()))
    
    }
    
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}





