//
//  TipView.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation
import SwiftUI

struct TipView: View {
    let tip: TipEntry
    
    
    var body: some View {
        VStack{
            Image(tip.typename)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .aspectRatio(contentMode: .fit)
                .padding(25)
            List {
                ForEach(tip.steps, id: \.self, content: { step in
                    
                        Text(step)
                    
                })
            }
        }.navigationTitle(tip.typename)
        
    }
}

//struct TipView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipView(tip: TipEntry)
//    }
//}
