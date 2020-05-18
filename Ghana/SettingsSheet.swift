//
//  BottomSheetView.swift
//  Ghanaian
//
//  Created by Tetra Apps on 5/17/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) private var colorScheme
    
    let settingList = [SettingsList(settingName: "About This App", imageName: "exclamationmark.bubble"),
                        SettingsList(settingName: "Character Settings", imageName: "pencil.circle"),
                        SettingsList(settingName: "Send A Message", imageName: "envelope"),
                        SettingsList(settingName: "Rate Us!", imageName: "textbox"),
                        SettingsList(settingName: "Share App", imageName: "square.and.arrow.up"),
                        SettingsList(settingName: "Terms & Privacy", imageName: "doc.circle")
                        ]
        
    let twitterUrl: NSURL = URL(string: "https://twitter.com/tetra_apps")! as NSURL

    var body: some View {
        // GeometryReader in case we need device dimensions
        GeometryReader{ (proxy: GeometryProxy) in
            // VStack where everything lives
            VStack{
                // HStack for the "Done" button -> shifted to top right
                HStack{
                    Spacer()
                    // Done button to dismiss sheet
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                            Text("Done")
                                .font(.body)
                                .padding()
                    }
                }
                
                // Navigation View for settings
                NavigationView {
                    // Load all navigation items and icons
                    List(self.settingList){settingsRow in
                        SettingsRow(settingsRow: settingsRow)
                    } // end List
                .navigationBarTitle(Text("Settings"))
                        
                } //end Navigation view
                
                // VStack for bottom of the screen
                VStack(alignment: .center){
                    // Make our logo clickable
                    Button(action: {UIApplication.shared.open(self.twitterUrl as URL)}){
                        Image("rocket")
                            .resizable()
                            .frame(width: 104.0, height: 165)
                    }
                    .buttonStyle(PlainButtonStyle()) // button fills everything as blue without this. We just want our logo
                    
                    // Text of company name
                    Text("TETRA APPS").multilineTextAlignment(.center)
                    .padding(.vertical, -40.0) .font(.custom("copperplate", size: 22))
                    
                    // HStack for "follow me text" and twitter logo.
                    HStack(alignment: .center){
                        // Twitter logo. Clickable and leads to company twitter
                        Button(action: {UIApplication.shared.open(self.twitterUrl as URL)}){
                                Image("twitter-logo")
                                .resizable()
                                    .frame(width: 25, height: 25)
                                .aspectRatio(contentMode: .fill)
                                // Button Text
                                Text("Follow us")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                        }

                }
                
             
            } // end VStack
        } // end GeometryReader
        
    }
    
}

//struct displaySettingsList: View{
//    let aboutSetting = SettingsList(settingName: "About This App", imageName: "exclamationmark.bubble")
//    let characterSetting = SettingsList(settingName: "Character Settings", imageName: "pencil.circle.fill")
//    let rateUsSetting = SettingsList(settingName: "Rate Us!", imageName: "textbox")
//    let sendUsAMessage = SettingsList(settingName: "Send A Message", imageName: "envelope.fill")
//    let shareApp = SettingsList(settingName: "Share App", imageName: "square.and.up.arrow.fill")
//    let termsAndPrivacy = SettingsList(settingName: "Terms & Privacy", imageName: "doc.circle.fill")
//
//    var body: some View {
//        VStack{
//            let firstList = [aboutSetting, characterSetting, rateUsSetting]
//            let secondList = [sendUsAMessage, shareApp, termsAndPrivacy]
//
//
//            let topList = List(firstList) { listItem in
//                Image(listItem.imageName)
//                VStack(alignment: .leading) {
//                    Text(listItem.settingName)
//
//                }
//            }
//
//            let bottomList = List(secondList) { listItem in
//                Image(listItem.imageName)
//                VStack(alignment: .leading) {
//                    Text(listItem.settingName)
//
//                }
//            }
//        }
//
//
//    }
//}

struct SettingsRow: View{
    var settingsRow: SettingsList
    
    var body: some View {
        HStack {
            Image(systemName: settingsRow.imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text(settingsRow.settingName)
            Spacer()
        }
    }
}


struct SettingsList: Hashable, Identifiable {
    let id = UUID()
    
    var settingName: String
    var imageName: String
}

// For testing purposes
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
