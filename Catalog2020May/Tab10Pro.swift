//
//  Tab10Pro.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 18.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10Pro: View {
    @State var txtkg : String = ""

    var stepI : [String] {
                     self.txtkg.components(separatedBy: "?")
        
    }
    @State var txtFirms : String = ""
    
    @ObservedObject var getRodel             =  Rodel()
                    var txt      : String
    
    
    @Binding var isPro : Bool
    
    var body: some View {
    VStack {
            HStack {
                Button(action: { self.isPro = false
                    
                }) {
                    Text("⏎")
                    .padding(.top)
                    .foregroundColor(.white)
                }
                Spacer()
            }.padding()
            .background(Color("greenCatallog"))
        
        ForEach(getRodel.database100.filter { $0.nameLecarstvo.lowercased() == (self.txt.lowercased())} ,  id: \.nameLecarstvo) { item in
            
           // Text(item.nameFirma)
            Text("")
                .onAppear(){ self.txtkg = item.nameFirma}
        }
        
        List {
            ForEach (0..<stepI.count , id: \ .self) { miro in
              Text("\(self.stepI[miro])")
                .font(.system(size: 18))
             
              
            }
        }
             Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct Tab10Pro_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Pro(txt: "alo", isPro: Binding.constant(false))
    }
}
