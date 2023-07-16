//
//  LocationNotificationDemoApp.swift
//  LocationNotificationDemoApp
//
//  Created by Ruben Alonso on 14/7/23.
//

import SwiftUI

@main
struct LocationNotificationDemoAppApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark) // Establecer modo oscuro
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                        if success && isFirstLaunch {
                            openSettings()
                            print("Success")
                            isFirstLaunch = false // Marcar como no es la primera vez
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
        }
    }
}
