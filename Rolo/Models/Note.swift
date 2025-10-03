//
//  Note.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import Foundation

struct Note: Identifiable, Codable, Equatable {
    var id: UUID
    var contactId: UUID
    var createdAt: Date
    var text: String
}

// Sample for testing
extension Note {
    static let sample = Note(
        id: UUID(),
        contactId: UUID(),
        createdAt: Date(),
        text: "Follow-up from last meeting: Alice is interested in AI news updates."
    )
}
