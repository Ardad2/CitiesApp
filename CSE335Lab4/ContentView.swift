//
//  ContentView.swift
//  CSE335Lab4
//
//  Created by Arjun Dadhwal on 2/27/23.
//

import SwiftUI

struct ContentView: View {

    @State var cityData = [
        city(name:"New Delhi"),
        city(name:"Tempe"),
        city(name:"Barcelona"),
        city(name:"Singapore"),
        city(name:"Cape Town")
    ]

    
    @State var toInsertView = false
    @State  var data = ""
    @State  var type = ""
    @State var sectionType = ["List of Cities visited"]
    
    var body: some View {
        NavigationView
        {
    
            List {
                    ForEach(cityData) { datum in
                        NavigationLink(destination: DetailView(name: datum.name))
                            {
                                Text(datum.name)
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
                   
                    TextField("Data:", text: $data)

                    Button("Insert", action: {
                            let c = city(name: data)
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
