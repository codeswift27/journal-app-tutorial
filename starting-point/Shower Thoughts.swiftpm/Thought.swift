//
//  Thought.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/4/25.
//

import Foundation

// Our Thought object contains all the details that each
// journal entry has
struct Thought: Codable, Identifiable {
    var title: String
    var content: String
    var dateCreated: Date
    var dateModified: Date
    var bookmarked: Bool
    var id: UUID
}
