//
//  MoodboardView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct MoodboardView: View {
    
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    var body: some View {
        
//        let columns = [
//            GridItem(.adaptive(minimum: 80)),
//            GridItem(.adaptive(minimum: 80))
//        ]
        
        List {
            ForEach(searchObjectController.results, id: \.id, content: { result in
                Text("Mood Board: \(searchObjectController.searchText)")
                    .fontWeight(.bold)
                    .padding(6)

                    
                        VStack {
                            WebImage(url: URL(string: result.urls.small) )
                                .resizable()
                                .frame(height:300)
                                
                        }
                        
                    })
            
            }.onAppear() {
                searchObjectController.search()
            }
        
                
                
            }
            
        
}


struct MoodboardView_Previews: PreviewProvider {
    static var previews: some View {
        MoodboardView()
    }
}
