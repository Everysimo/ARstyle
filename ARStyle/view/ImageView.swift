//
//  ImageView.swift
//  ARStyle
//
//  Created by Antonio Trapanese on 20/07/22.
//

import SwiftUI
import UIKit
struct ImageView: View {
    let size: Double
    let item: UIImage

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage:item)
            }
            .frame(width: size, height: size)
        }
    }


struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageView(size: 50, item:UIImage(imageLiteralResourceName: "Round1"))
        
    }
}
