//
//  Settings.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI
import Combine

class Settings: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
        
    @Published var types = ["Off","On"]
    @Published var type = 0 { didSet { update() } }
    
    @Published var isToggleOn = false { didSet { update() } }
    
    func update() {
        didChange.send(())
    }
}
