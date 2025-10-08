//
//  Contact.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import Foundation

struct Contact: Identifiable, Codable, Equatable {
    var id: UUID
    var fullName: String
    var role: String?
    var company: String?
    var tags: [String]? //tags for grouping or filtering contacts
    var lastInteraction: Date? //most recent interaction with contact
    var linkedinURL: URL?
    var notes: [Note] = []
}


// MARK: - Sample Data for Previews / Testing
extension Contact {
    static let sample = Contact(
        id: UUID(),
        fullName: "Heather Meade",
        role: "Product Manager",
        company: "TechCorp",
        tags: ["AI", "Priority"],
        lastInteraction: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30),
        linkedinURL: URL(string: "https://www.linkedin.com/in/alicejohnson"),
        notes: [
            Note(
                id: UUID(),
                contactId: UUID(), // replace with `sample.id` in preview context
                createdAt: Date(),
                text: "Met at AI conference. Interested in collaboration."
            )
        ]
    )
    static func sampleLinked() -> Contact {
            var c = Contact.sample
            c.notes = c.notes.map { note in
                var n = note
                n.contactId = c.id
                return n
            }
            return c
        }
}
