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

// Our settings options
extension Option {    
    static let options: [Option] =
        [
        .init(title: "About", isAddSection: false, imageName: "bubble.left.and.bubble.right", view: AnyView(AboutView())),
        .init(title: "Keyboard Settings", isAddSection: false, imageName: "keyboard", view: AnyView(KeyboardSettingsView())),
        .init(title: "Send A Message", isAddSection: false, imageName: "bubble.left.and.bubble.right", view: AnyView(AboutView())),
        .init(title: "Rate Us!", isAddSection: false, imageName: "pencil.and.ellipsis.rectangle", view: AnyView(AboutView())),
        .init(title: "Share App", isAddSection: true, imageName: "square.and.arrow.up.on.square", view: AnyView(ShareSheetView(activityItems: ["Test"]))),
        .init(title: "Information View", isAddSection: false, imageName: "info.circle", view: AnyView(IntroductionView())),
        .init(title: "Terms and Privacy", isAddSection: false, imageName: "doc.circle", view: AnyView(LicenseAgreement())),
        .init(title: "Full Access Information", isAddSection: false, imageName: "eye", view: AnyView(AboutView()))
        ]
}
