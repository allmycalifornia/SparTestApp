//
//  Spar_Online_TestAppApp.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI
import Swinject

@main
struct SparApp: App {
    private let container: Container

    @MainActor
    init() {
        self.container = Container()
        registerServices()
    }
    
    var body: some Scene {
        WindowGroup {
            ItemsScreen(viewModel: ItemsScreenViewModel(fetchDataService: container.resolve(FetchDataServiceProtocol.self)!))
        }
    }
    
    private func registerServices() {
        container.register(FetchDataServiceProtocol.self) { _ in
            MockFetchDataService()
        }
    }
}
