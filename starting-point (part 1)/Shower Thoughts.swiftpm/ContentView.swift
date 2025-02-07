import SwiftUI

struct ContentView: View {
    // We need some way to keep track of which page we're on.
    // We can do this using an enum called Page that stores
    // journal and bookmark cases

    // This is our sample data
    let sampleData: [Thought] = [
        Thought(title: "Sometimes", content: "I wonder why the sky is blue", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Cool", content: "I saw a really cool looking duck today! It was dark green and had shiny feathers", dateCreated: Date(), dateModified: Date(), bookmarked: true, id: UUID()),
        Thought(title: "🍭🍬🍡", content: "I'm craving some sweets 😋", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Ahhhhhhh", content: "Why do I have so much homeworkkkk when is spring break :/", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID())
    ]
    
    var body: some View {
        // Here is where our content will go. We can either use a tab
        // view or a navigation split view to create our sidebar
        Text("Hello, world")
    }
}
