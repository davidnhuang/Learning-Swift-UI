//
//  TextFieldManager.swift
//  Text Input Manager
//
//  Created by David N. Huang on 5/16/21.
//

import SwiftUI

class example: ObservableObject {
    var limit = 5
    
    @Published var input = "" {
        didSet {
            if input.count > limit {
                input = String(input.prefix(limit))
            }
        }
    }
    
}
