//
//  cityModel.swift
//  CSE335Lab4
//
//  Created by Arjun Dadhwal on 2/27/23.
//

import Foundation

struct City: Identifiable{
    var id = UUID()
    var name = String()
    var picture = String()
    var description = String()
}

struct section:Identifiable
{
    let id = UUID()
    let name: String
}

struct CityGroup: Identifiable {
    var id = UUID()
    var groupName: String
    var cities : [City]
}
