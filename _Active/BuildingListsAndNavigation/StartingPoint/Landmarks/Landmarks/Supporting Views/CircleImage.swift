/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    
    // To make this dynamic, we need to tell the program to take a image in
    // Here, we are applying the Image view protocol to the image variable
    var image: Image
    
    var body: some View {
        
        image // Since previously we've declared that image will use the Image view protocol, we can pass it here
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        // Since this is just preview, we don't need to do any updating to affect the code
        CircleImage(image: Image("turtlerock"))
    }
}
