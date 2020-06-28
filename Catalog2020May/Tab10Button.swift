//
//  Tab10Button.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 18.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10Button: View {
        
                 var txt      : String
        @Binding var isShow   : Bool
        
        var body: some View {
            HStack {
               
                Button(action: {
                                 self.isShow.toggle()
                }) {
                    HStack {
                       
                        Text("\(txt)".uppercased())
                            
                        Spacer()
                        Text("▷")
                            
                    }.padding(.horizontal, 10)
                    .font(.system(size: 16))
                }
                
            }
        }
    }

struct Tab10Button_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Button(txt: "11", isShow: Binding.constant(false) )
    }
}
