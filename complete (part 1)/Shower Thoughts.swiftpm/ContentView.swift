import SwiftUI

struct ContentView: View {
    @State var view: Page = .journal
    
    enum Page {
        case journal, bookmarks
    }
    
    // This is our sample data
    let sampleData: [Thought] = [
        Thought(title: "Sometimes", content: "I wonder why the sky is blue", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Cool", content: "I saw a really cool looking duck today! It was dark green and had shiny feathers", dateCreated: Date(), dateModified: Date(), bookmarked: true, id: UUID()),
        Thought(title: "🍭🍬🍡", content: "I'm craving some sweets 😋", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID()),
        Thought(title: "Ahhhhhhh", content: "Why do I have so much homeworkkkk when is spring break :/", dateCreated: Date(), dateModified: Date(), bookmarked: false, id: UUID())
    ]
    
    var body: some View {
        NavigationSplitView {
            List {
                Button(action: { view = .journal }) {
                    if view == .journal {
                        Label("Journal", systemImage: "book.closed.fill")
                            .foregroundStyle(Color.primary.dark)
                    } else {
                        Label("Journal", systemImage: "book.closed.fill")
                    }
                }
                .listRowBackground(view == .journal ? Color.accentColor.cornerRadius(10) : Color.clear.cornerRadius(10))
                Button(action: { view = .bookmarks }) {
                    if view == .bookmarks {
                        Label("Bookmarks", systemImage: "bookmark.fill")
                            .foregroundStyle(Color.primary.dark)
                    } else {
                        Label("Bookmarks", systemImage: "bookmark.fill")
                    }
                }
                .listRowBackground(view == .bookmarks ? Color.accentColor.cornerRadius(10) : Color.clear.cornerRadius(10))
            }
            .listStyle(.sidebar)
            .navigationTitle("My Thoughts")
        } detail: {
            switch view {
            case .journal:
                JournalView(data: sampleData)
            case .bookmarks:
                JournalView(data: sampleData.filter { $0.bookmarked })
            }
        }
    }
}
