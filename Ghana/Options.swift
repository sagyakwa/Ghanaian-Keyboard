//
//  Options.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI
import Combine

struct Option {
    var id = UUID()
    var title: String
    var isAddSection: Bool
    var imageName: String
    var view: AnyView
}

extension Option {    
    static let options: [Option] = [
        .init(title: "About", isAddSection: false, imageName: "exclamationmark.bubble", view: AnyView(About())),
        .init(title: "Keyboard Settings", isAddSection: false, imageName: "keyboard.chevron.compact.down", view: AnyView(KeyboardSettings())),
        .init(title: "Send A Message", isAddSection: false, imageName: "bubble.left.and.bubble.right", view: AnyView(About())),
        .init(title: "Rate Us!", isAddSection: true, imageName: "textbox", view: AnyView(About())),
        .init(title: "Share App", isAddSection: false, imageName: "square.and.arrow.up.on.square", view: AnyView(ShareSheet(activityItems: ["Test"]))),
        .init(title: "Terms and Privacy", isAddSection: false, imageName: "doc.circle", view: AnyView(LicenseAgreement())),
        .init(title: "Full Access Information", isAddSection: false, imageName: "eye", view: AnyView(About()))
    
    ]
}
