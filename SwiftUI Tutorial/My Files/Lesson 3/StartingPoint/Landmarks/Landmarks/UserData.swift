//
//  UserData.swift
//  Landmarks
//
//  Created by David N. Huang on 12/2/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
