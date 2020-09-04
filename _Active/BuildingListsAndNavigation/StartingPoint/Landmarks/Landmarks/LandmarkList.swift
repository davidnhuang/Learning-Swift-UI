//
//  LandmarkList.swift
//  Landmarks
//
//  Created by David N. Huang on 9/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        // Navigation view
        // Adds navigation capabilities between parent view and child view
        NavigationView {
            
            // List view
                // To make the list dynamically filled, you must supply it with data and provide closure
                // Closure is a function stored as a variable
            
            // Here, we've fed landmarkData json into the list, and use the identifiable protocol in the landmark struct
            List(landmarkData) {
                
                // List closure: Here, we will cycle through as many items are located in landmarkData
                landmark in
                
                // Setting a destination for every row; since every row can be tapped, it is wrapped in the closure; destination is a view
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    
                    // Showing the actual row from custom view LandmarkRow
                    LandmarkRow(landmark: landmark)
                    
                }
                
                // Homework -> practice how to set up dynamic lists more with other tutorials
            }
                
            // Modifiers for navigation view
            .navigationBarTitle(Text("Landmarks"))
            
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
