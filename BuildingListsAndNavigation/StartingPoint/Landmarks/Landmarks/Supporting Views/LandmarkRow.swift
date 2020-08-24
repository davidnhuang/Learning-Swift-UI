//
//  LnadmarkRow.swift
//  Landmarks
//
//  Created by David N. Huang on 8/23/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 48, height: 48)
            Text(landmark.name)
            Spacer()
        }.padding()
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkRow(landmark:landmarkData[0])
            LandmarkRow(landmark:landmarkData[1])
        }.previewLayout(.fixed(width: 300,height: 48))
    }
}
