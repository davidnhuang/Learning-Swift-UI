 //
//  LandmarkRow.swift
//  Landmarks
//
//  Created by David N. Huang on 9/2/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark // This is called instantiation - we've created an instance of Landmark data structure, allowing us to access this template of data
    // Think about instantiation like this
          // 1. You tell the program that you want to use a data structure, like a template
          // 2. After you've done that, or created an instance of the template, you feed it data that fills into the template

    
    var body: some View {
        HStack {
            landmark.image // Since we've instantiated the Landmark data object, now we can access specific attributes of the struct
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
            LandmarkRow(landmark: landmarkData[0]) // Since we've created the Landmark instance above and applied it to landmark var, we can now pass a specific object from json into the view
    }
        
}

