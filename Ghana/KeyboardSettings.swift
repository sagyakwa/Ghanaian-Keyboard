//
//  KeyboardSettings.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct KeyboardSettings: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var offset : CGFloat = UIScreen.main.bounds.height
    @State var keyboardToggle = false
    @State var akanToggle = false
    @State var eweToggle = false
    @State var gaToggle = false
    @State var dagbaniToggle = false
    
    var body : some View{
        ZStack{
            VStack (spacing: 55){
                VStack{
                    HStack{
                        Toggle(isOn: $keyboardToggle){
                            Text("Keyboard")
                                .font(.title)
                        }.onTapGesture {
                            print("Test")
                        }
                    }
                }
                
                VStack (spacing: 15){
                    HStack{
                       Toggle(isOn: $akanToggle)
                       {
                            Text("Akan")
                                .font(.title)
                        }
                       .onTapGesture {
                            print("Test")
                        }
                        
                    }
                    
                    HStack{
                        Toggle(isOn: $eweToggle){
                            Text("Ewe")
                                .font(.title)
                        }.onTapGesture{
                            
                        }
                    }
                    
                    HStack{
                        Toggle(isOn: $gaToggle){
                            Text("Ga")
                                .font(.title)
                        }.onTapGesture{
                            
                        }
                    }
                    
                    HStack{
                        Toggle(isOn: $dagbaniToggle){
                            Text("Dagbani")
                                .font(.title)
                        }.onTapGesture{
                            
                        }
                    }
                }
            }.padding()
            
            }
    }
    
    func setOffset(offset: CGFloat) -> Void{
        self.offset = offset
    }
}

struct KeyboardSettings_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardSettings()
    }
}
