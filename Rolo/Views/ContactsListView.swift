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
            fullName: "Brian Tinsley",
            role: "Software Engineer",
            company: "Fruit Co.",
            tags: ["iOS", "Mentor"],
            lastInteraction: Date().addingTimeInterval(-86_400 * 7),
            linkedinURL: URL(string: "https://www.linkedin.com/in/example"),
            notes: []
        ),
        Contact(
            id: UUID(),
            fullName: "Ella Wang",
            role: "Design Lead",
            company: "Northwind",
            tags: ["Design"],
            lastInteraction: Date().addingTimeInterval(-86_400 * 3),
            linkedinURL: nil,
            notes: []
        ),
        Contact(
            id: UUID(),
            fullName: "Jessica Fung",
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
                            ContactCard(contact: contact)
                                .padding(.bottom)
                        }
                        .buttonStyle(.plain)
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


private struct ContactCard: View {
    let contact: Contact

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Top row: avatar + text + LinkedIn badge
            HStack(alignment: .center, spacing: 12) {
                ProfilePictureView()
                    .frame(width: 64, height: 64)

                VStack(alignment: .leading, spacing: 2) {
                    Text(contact.fullName)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    if let role = contact.role, !role.isEmpty {
                        Text(role)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    if let company = contact.company, !company.isEmpty {
                        Text(company)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer(minLength: 8)
                /* if let url = contact.linkedinURL {
                    LinkedInBadge(url: url)
                }*/
            }

            // Prompt bar- change later
            HStack(spacing: 8) {
                Text("Message...")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.gray.opacity(0.18))
                    )

                // Small trailing action icon- non-interactive here
             /*   Image(systemName: "gearshape.fill")
                    .font(.subheadline)
                    .padding(8)
                    .background(
                        Circle().fill(Color.gray.opacity(0.18))
                    ) */
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                //.fill(Color(.systemBackground))
                .fill(Color.gray.opacity(0.07))
                .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
        )
    }
}

private struct ProfilePictureView: View {
    var body: some View {
        Circle()
            .fill(Color.gray.opacity(0.25))
            .overlay(
                Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

#Preview {
    ContactsListView()
}
