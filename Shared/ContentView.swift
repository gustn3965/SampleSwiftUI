//
//  ContentView.swift
//  Shared
//
//  Created by hyunsu on 2021/06/02.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: SandwichStore

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(store.sandwiches) { sandwich in
                        SandwichCell(sandwich: sandwich)
                    }
                    .onMove(perform: move)
                    .onDelete(perform: delete)
                    HStack {
                        Spacer()
                        Text("sandwiches: \(store.sandwiches.count)")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                
                .navigationTitle("Sandwiches")
                .toolbar{
                    HStack {
                        #if os(iOS)
                        EditButton()
                        #endif
                        Button("Add", action: append)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    func append() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "sandwich", isSpicy: true, ingredientsCount: 10))
        }
    }
    
    func move(from: IndexSet, to: Int) {
        store.sandwiches.move(fromOffsets: from, toOffset: to)
    }
    
    func delete(offsets: IndexSet) {
        store.sandwiches.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                Image(sandwich.thumbNail)
                    .resizable()
                    .background(Color.yellow)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(10)
                VStack {
                    Text(sandwich.name)
                    Text(sandwich.ingredients)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
