//
//  ContactsListView.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import SwiftUI

struct ContactsListView: View {
    // Replace with your real data source / ViewModel later.
    @State private var contacts: [Contact] = [
        .sampleLinked(),
        Contact(
            id: UUID(),
            fullName: "John Appleseed",
            role: "Software Engineer",
            company: "Fruit Co.",
            tags: ["iOS", "Mentor"],
            lastInteraction: Date().addingTimeInterval(-86_400 * 7),
            linkedinURL: URL(string: "https://www.linkedin.com/in/example"),
            notes: []
        ),
        Contact(
            id: UUID(),
            fullName: "Sarah Chen",
            role: "Design Lead",
            company: "Northwind",
            tags: ["Design"],
            lastInteraction: Date().addingTimeInterval(-86_400 * 3),
            linkedinURL: nil,
            notes: []
        )
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(contacts) { contact in
                        NavigationLink(value: contact.id) {
                            Text(contact.fullName)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 12)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)

                        Divider()
                            .padding(.leading, 0)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.large)
            // Route by UUID and look up the contact to display.
            .navigationDestination(for: UUID.self) { id in
                if let contact = contacts.first(where: { $0.id == id }) {
                    ContactView(contact: contact)
                } else {
                    Text("Contact not found").foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ContactsListView()
}
