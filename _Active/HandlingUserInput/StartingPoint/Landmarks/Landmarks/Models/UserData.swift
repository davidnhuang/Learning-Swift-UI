//
//  UserData.swift
//  Landmarks
//
//  Created by David N. Huang on 9/5/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var showFavoriteOnly = false
    @Published var landmark = landmarkData
    
}
