//
//  CircleImage.swift
//  SwiftUIDemo1
//
//  Created by David N. Huang on 8/19/20.
//  Copyright © 2020 David N. Huang. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock").clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 10)
    
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
