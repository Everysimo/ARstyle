//
//  GalleryView.swift
//  ARStyle
//
//  Created by Antonio Trapanese on 20/07/22.
//

import SwiftUI

struct GalleryView: View {
    
    private static let initialColumns = 3
    @State private var isAddingPhoto = false
    @State private var isEditing = false
    @EnvironmentObject private var imageModel: ImageModel

    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    
    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(imageModel.imageArray, id: \.self) { item in
                        NavigationLink(destination: ImageView(item: item), label: {
                            Image(uiImage:item).resizable().aspectRatio(contentMode: .fit)
                            
                        })
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView().environmentObject(ImageModel())
    }
}
 
