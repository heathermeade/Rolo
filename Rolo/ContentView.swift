//
//  ContentView.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            TabView {
                NavigationStack {
                    //HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                NavigationStack {
                    ContactsListView()
                }
                .tabItem {
                    Label("Contacts", systemImage: "person.2")
                }
                NavigationStack {
                    ContactView(contact: .sampleLinked())
                }
                .tabItem {
                    Label("Contact", systemImage: "bubble.left.and.bubble.right")
                }
                NavigationStack {
                    //NudgesFeedView()
                }
                .tabItem {
                    Label("Nudges", systemImage: "lightbulb")
                }
                NavigationStack {
                    //SettingsView()
                }
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
