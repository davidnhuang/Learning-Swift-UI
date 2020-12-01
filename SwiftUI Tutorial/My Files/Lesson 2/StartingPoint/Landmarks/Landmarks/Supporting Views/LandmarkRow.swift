//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by David N. Huang on 11/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    // storing Landmark property (property declared in Landmark.swift)
    var landmark: Landmark
    
    var body: some View {
        HStack {
            
            // Landmark thumbnail
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            // Landmark name
            Text(landmark.name)
            
            // Flex spacer
            Spacer()
        }
    }
}

// This is the preview canvas
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        // When you want to preview the Landmark property, you need to provide which data in the json file to be used
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 375, height: 70))
    }
}
