//
//  Tab10List00.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 4.06.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10List00: View {
    var body: some View {
                GeometryReader { reader in
                VStack {
                    Image("withBackground")
                       .resizable()
                   
                }
                .frame(width: reader.size.width / 1.15, height: reader.size.width / 1.15)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 50)
                .shadow(color: Color("greenCatallog"), radius: 10, x: 5, y: 5)
                    
                }
                
            }
        }
struct Tab10List00_Previews: PreviewProvider {
    static var previews: some View {
        Tab10List00()
    }
}
