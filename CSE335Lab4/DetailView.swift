//
//  DetailView.swift
//  CSE335Lab4
//
//  Created by Arjun Dadhwal on 2/27/23.
//

import Foundation

import SwiftUI

struct DetailView: View {
    var picture:String
    var name:String
    var description:String
    
    var body: some View {
        VStack(){
                Text(name).font(.system(size: 36))
                Image("\(picture)").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
            Text(description)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(picture:"Hi", name:"Hi", description:"A")
    }
}
