//
//  DetailView.swift
//  CSE335Lab4
//
//  Created by Arjun Dadhwal on 2/27/23.
//

import Foundation

import SwiftUI

struct DetailView: View {
    var name:String
    
    var body: some View {
        Text(name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name:"Hi")
    }
}
