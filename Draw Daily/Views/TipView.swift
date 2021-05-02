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
            Text(tip.typename)
            Image("placeholder")
            ForEach(tip.steps, id: \.self, content: { step in
                Text(step)
            })
        }
        
    }
}

//struct TipView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipView(tip: TipEntry)
//    }
//}
