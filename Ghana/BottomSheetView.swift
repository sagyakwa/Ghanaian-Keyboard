//
//  BottomSheetView.swift
//  Ghanaian
//
//  Created by Samuel Agyakwa on 5/17/20.
//  Copyright © 2020 Samuel Agyakwa. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("I am showing the Detail")
    }
}

struct BottomSheetView: View{
    @State var showingDetail = false

    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            Text("Show Detail")
        }.sheet(isPresented: $showingDetail) {
            SettingsView()
        }
    }
}

#if DEBUG
struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
#endif
