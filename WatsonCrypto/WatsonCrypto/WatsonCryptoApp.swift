//
//  WatsonCryptoApp.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/18/24.
//

import SwiftUI

@main
struct WatsonCryptoApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
               HomeView()
                    .toolbar(.hidden)
            }             //.environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(vm)
        }
    }
}
