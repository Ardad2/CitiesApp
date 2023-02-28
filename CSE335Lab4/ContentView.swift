//
//  ContentView.swift
//  CSE335Lab4
//
//  Created by Arjun Dadhwal on 2/27/23.
//

import SwiftUI

struct ContentView: View {

    @State var cityData = [
        city(name:"New Delhi", description: "India"),
        city(name:"Tempe", description: "United States"),
        city(name:"Barcelona", description: "Spain"),
        city(name:"Singapore", description:"Singapore"),
        city(name:"Cape Town", description:"South Africa")
    ]

    
    @State var toInsertView = false
    
    @State  var newCityName = ""
    @State var newCityDescription = ""
    @State  var type = ""
    @State var sectionType = ["List of Cities visited"]
    
    var body: some View {
        NavigationView
        {
    
            List {
                    ForEach(cityData) { datum in
                        NavigationLink(destination: DetailView(name: datum.name, description: datum.description))
                            {
                                HStack {
                                    Text(datum.name)
                                    Text(datum.description)
                                }
                            }
                    }.onDelete(perform: {IndexSet in
                        cityData.remove(atOffsets: IndexSet)
                    })
                    

            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Cities Visited")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                         
                            toInsertView = true
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }.alert("Insert", isPresented: $toInsertView, actions: {
                   
                    TextField("Name:", text: $newCityName)
                    TextField("Description: ", text: $newCityDescription)

                    Button("Insert", action: {
                        let c = city(name: newCityName, description: newCityDescription)
                        cityData.append(c)
                            toInsertView = false
   
                        
                    })
                    Button("Cancel", role: .cancel, action: {
                        toInsertView = false
                    })
                }, message: {
                    Text("Enter the details of the city you want to add")
                })
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
