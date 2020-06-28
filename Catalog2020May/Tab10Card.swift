//
//  Tab10Card.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 27.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10Card: View {
    var dossi : String
    var lek   : String
    var vid   : String
    
    
    var body: some View {
      
            VStack {
                HStack {
                    Spacer()
                    Text("\(vid)")
                      .padding()
                    Spacer()
                }.background(Color.green)
                ScrollView(.vertical, showsIndicators: true) {
                    Text("\(dossi)")
                        .padding()
                }
                Spacer()
                Divider()
                Text("\(lek)")
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 500)
            .background(Color.white)
            .cornerRadius(25)
       
    }
}

struct Tab10Card_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Card(dossi: "111", lek: "222", vid: "333")
    }
}
