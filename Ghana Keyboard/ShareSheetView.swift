////
////  ShareSheet.swift
////  Ghanaian Keyboard
////
////  Created by Samuel Agyakwa on 5/18/20.
////  Copyright © 2020 Tetra Apps. All rights reserved.
////
//
import SwiftUI

struct ShareSheetView: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
      
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
      
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
      
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}

#if DEBUG
struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView(activityItems: ["Test"])
    }
}
#endif
