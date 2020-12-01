//
//  LandmarkList.swift
//  Landmarks
//
//  Created by David N. Huang on 11/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView {
            
            // id: \.id gives each listed row a unique id, and loops through until end?
            // using Identifiable protocol in landmark struct, we use the ID property in the struct as a way to identify each data object
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark) // landmark is the index path
                }
            }
            
            // Navigation bar
            .navigationBarTitle(Text("Landmarks"))
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
