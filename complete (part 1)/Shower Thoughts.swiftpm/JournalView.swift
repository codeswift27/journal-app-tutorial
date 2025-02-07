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
        VStack {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 280, maximum: 320), alignment: .top), GridItem(.flexible(minimum: 280, maximum: 320), alignment: .top), GridItem(.flexible(minimum: 280, maximum: 320), alignment: .top)]) {
                ForEach(data) { thought in
                    NavigationStack {
                        NavigationLink(destination: JournalDetail(title: thought.title, content: thought.content, dateCreated: thought.dateCreated, dateModified: thought.dateModified, bookmarked: thought.bookmarked)) {
                            JournalCard(title: thought.title, content: thought.content, bookmarked: thought.bookmarked)
                                .frame(height: 240)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                }
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Journal")
        .toolbar {
            Button("plus", systemImage: "plus") {
                
            }
        }
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
