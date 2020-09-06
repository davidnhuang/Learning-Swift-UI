/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    
    // States
    // @State var showFavoritesOnly = false
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {

//            List(landmarkData) { landmark in
//
//                // If showFavoritesOnly state is true or if this landmarkRow's isFavorite attribute is true
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
            
            List {
                
                // Toggle switch
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("Show favorites only")
                }
                
                ForEach(userData.landmark) { landmark in
                    
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(UserData())
    }
}
