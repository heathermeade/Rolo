//
//  SettingsView.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    NavigationLink(destination: ContactsListView()) {
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.blue)
                            Text("Profile")
                                .font(.headline)
                            Spacer() // pushes text+icon left
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    NavigationLink(destination: ContactsListView()) {
                        HStack {
                            Image(systemName: "shield")
                                .foregroundColor(.blue)
                            Text("Login and Security")
                                .font(.headline)
                            Spacer() // pushes text+icon left
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    NavigationLink(destination: ContactsListView()) {
                        HStack {
                            Image(systemName: "bell")
                                .foregroundColor(.blue)
                            Text("Notifications")
                                .font(.headline)
                            Spacer() // pushes text+icon left
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    NavigationLink(destination: ContactsListView()) {
                        HStack {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                            Text("Settings")
                                .font(.headline)
                            Spacer() // pushes text+icon left
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
