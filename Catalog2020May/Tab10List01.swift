//
//  Tab10List01.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 4.06.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10List01: View {
    var body: some View {
        GeometryReader { reader in
        VStack {
            VStack {
                Text("                                   ")
                Text("OPPORTUNITIES")
                Text("                                   ")

            }.frame(maxWidth: .infinity)
            .background(Color.init("greenCatallog"))
            .multilineTextAlignment(.center)
                ScrollView(.vertical, showsIndicators: true){
             
                    VStack {
                         Text("Group I")
                             .foregroundColor(Color.init("greenCatallog"))
                         Text("acting bactericidal on propagating and non-propagating microorganisms - aminosides, polymyxins, fluoroquinolones, co-trimoxazole")
                             .padding()
                            
                    } 
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                    VStack {
                        Text("Group II")
                           .foregroundColor(Color.init("greenCatallog"))
                        Text("acting bactericidal only on breeding microorganisms - beta-lactams, vancomycin")
                             .padding()
                             
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                    VStack {
                        Text("Group III")
                           .foregroundColor(Color.init("greenCatallog"))
                        Text("this group has bacteriostatic effects \n(at high doses may have a bactericidal effect) - tetracyclines, macrolides, floramphenicol, lincosamides, rifampicin, sulfonamides, nitrofuran, oxyquinolines, metronidazole.")
                           .padding()
                         
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                }.multilineTextAlignment(.center)
           
          
        }
        .frame(width: reader.size.width / 1.15, height: reader.size.width / 1.15)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.top, 50)
        .shadow(color: Color("greenCatallog"), radius: 10, x: 5, y: 5)
            
        }
        
    }
}

struct Tab10List01_Previews: PreviewProvider {
    static var previews: some View {
        Tab10List01()
    }
}
