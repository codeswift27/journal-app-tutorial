//
//  JournalView.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/3/25.
//

import SwiftUI

struct JournalView: View {
    let data: [Thought]
    
    var body: some View {
        // To display our journal entries, we can put our
        // journal cards in a grid using LazyVGrid
        Text("Hello, world")
    }
}

#Preview {
    JournalView(data: [
        Thought(title: "Sometimes", content: "I wonder why the sky is blue", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Cool", content: "I saw a really cool looking duck today! It was dark green and had shiny feathers", dateCreated: Date(), dateModified: Date(), bookmarked: true, id: UUID()),
        Thought(title: "🍭🍬🍡", content: "I'm craving some sweets 😋", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Ahhhhhhh", content: "Why do I have so much homeworkkkk when is spring break :/", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID())
    ])
}
