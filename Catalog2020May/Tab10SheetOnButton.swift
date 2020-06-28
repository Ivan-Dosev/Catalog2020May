//
//  Tab10SheetOnButton.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 18.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10SheetOnButton: View {
             var txt      : String
    @Binding var isOnButton   : Bool
    
    var body: some View {
        HStack {
            
            Button(action: { self.isOnButton.toggle()}) {
                HStack {
                    Text("\(txt)".uppercased())
                    .lineLimit( 1 )
                        .font(.system(size: 14))
                    Spacer()
                    Text("▷")
                    .font(.system(size: 16))

                }.padding(.horizontal, 8)
               // .font(.system(size: 12))
               
              
            }

           
        }
    }
}

struct Tab10SheetOnButton_Previews: PreviewProvider {
    static var previews: some View {
        Tab10SheetOnButton(txt: "11", isOnButton: Binding.constant(false))
    }
}
