//
//  SampleSwiftUIApp.swift
//  Shared
//
//  Created by hyunsu on 2021/06/02.
//

import SwiftUI

@main
struct SampleSwiftUIApp: App {
    
    @StateObject var store : SandwichStore = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
