//
//  ContactView.swift
//  Rolo
//
//  Created by Heather Meade on 10/2/25.
//

import Foundation
import SwiftUI

struct ContactView: View {
    let contact: Contact
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        ScrollView {
            VStack {
                Text(contact.fullName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    if let role = contact.role, !role.isEmpty {
                        Text(role)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    if let company = contact.company, !company.isEmpty {
                        Text(company)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                }
                if !contact.tags!.isEmpty  {
                    // Display tags
                }
                if let last = contact.lastInteraction {
                    HStack{
                        Image(systemName: "clock")
                        Text("Last interaction \(last)")
                    }
                    .font(.subheadline)
                    //                   //.foregorundStyle(.secondary)
                    .padding()
                }
            }
            .padding()
            if contact.linkedinURL != nil {
                Text("Quick Actions")
                HStack(spacing: 12) {
                    Button("Add Note", systemImage: "square.and.pencil") {
                        // Hook up to your Notes flow
                    }
                    Button("Set Reminder", systemImage: "bell") {
                        // Hook up to your reminders flow
                    }
                    if let url = contact.linkedinURL {
                        Button("View LinkedIn", systemImage: "link") {
                            openURL(url)
                        }
                    }
                }
            }
            Text("AI Brief")
            VStack(alignment: .leading, spacing: 8) {
                Text("Relevant news & suggested talking points will appear here.")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.quaternary)
                    )
            }
            Text("Meeting Notes")
            if contact.notes.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                            Text("No notes yet").font(.headline)
                            Text("Add your first note to keep track of conversations and follow-ups.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(.quaternary)
                        )
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(contact.notes.sorted(by: { $0.createdAt > $1.createdAt })) { note in
                        NoteCard(note: note)
                    }
                }
            }
        }
    }
}

private struct NoteCard: View {
    let note: Note
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.createdAt.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(note.text)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(.background, in: RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color(.quaternaryLabel))
        )
    }
}

