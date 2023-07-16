//
//  ContentView.swift
//  LocationNotificationDemoApp
//
//  Created by Ruben Alonso on 14/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var body: some View {
        VStack {
            DatePicker("SelectDate", selection: $date)
                .datePickerStyle(.graphical)
                .padding()
                .tint(.green.opacity(0.6))
                .background(.gray.opacity(0.3))
                .cornerRadius(10)
            Spacer()
            Button("Generate Notification", role: .cancel) {
                let content = UNMutableNotificationContent()
                
                content.title = "Notif title"
                content.subtitle = "Notif subt"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .padding()
        }
        .padding()
        .font(.title2)
        .accentColor(.green)
    }
}

func openSettings() {
    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
    Task { @MainActor in
        UIApplication.shared.open(settingsURL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
