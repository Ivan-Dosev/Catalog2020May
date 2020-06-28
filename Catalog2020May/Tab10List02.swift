//
//  Tab10List02.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 4.06.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10List02: View {
    var body: some View {
                GeometryReader { reader in
                VStack {
                    VStack {
                        Text("                   ")
                        Text("Combination")
                        Text("                   ")
                    }.frame(maxWidth: .infinity)
                    .background(Color.init("greenCatallog"))
                    .multilineTextAlignment(.center)
                    
                    ScrollView(.vertical, showsIndicators: true){
                        VStack {
                            VStack {
                                Text("Combining Group I and Group II")
                                   .foregroundColor(Color.init("greenCatallog"))
                                Text("Additive or potentiating effect, but never antagonism.")
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                  // ................
                            VStack {
                                Text("Combining Group I and Group III")
                                   .foregroundColor(Color.init("greenCatallog"))
                                Text("Often an additive effect, but never antagonism")
                                     .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                   // .................
                            VStack {
                                 Text("Combining Group II and Group III")
                                    .foregroundColor(Color.init("greenCatallog"))
                                Text("It most often causes a significant reduction in the effect of the bactericidal agent because it only acts on fissile microorganisms. An exception is observed in the combination of beta-lactams with sulfonamides (in which case an additive effect develops because, by breaking the bacterial wall, beta-lactams favor the action of sulfonamides) and metronidazole")
                                     .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                 // .....................
                            VStack {
                                Text("Combining Group I preparations")
                                     .foregroundColor(Color.init("greenCatallog"))
                                Text("Irrational because of the risk of intensifying their side effects (ototoxicity, nephrotoxicity, etc.)")
                                     .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                 // .....................
                            VStack {
                                Text("Combining Group II preparations")
                                   .foregroundColor(Color.init("greenCatallog"))
                                Text("Rationally due to the broadening of the bactericidal spectrum of the combination")
                                     .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

                 // ....................
                            VStack {
                                  Text("Combining Group III preparations")
                                     .foregroundColor(Color.init("greenCatallog"))
                                  Text("Usually an additive effect is expected. An exception is made by combinations of representatives affecting the 50S subunit of ribosomes (chloramphenicol, macrolides, linkosamides) leading to antagonism")
                                      .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init("greenCatallog"), lineWidth: 2))

  
                        }.multilineTextAlignment(.center)
                    }
                }
                .frame(width: reader.size.width / 1.15, height: reader.size.width / 1.15)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 50)
                .shadow(color: Color("greenCatallog"), radius: 10, x: 5, y: 5)
                    
                }
                
            }
        }
struct Tab10List02_Previews: PreviewProvider {
    static var previews: some View {
        Tab10List02()
    }
}
