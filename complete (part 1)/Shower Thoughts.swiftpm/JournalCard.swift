//
//  JournalCard.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/3/25.
//

import SwiftUI

struct JournalCard: View {
    var title: String
    var content: String
    var bookmarked: Bool
    var body: some View {
        GroupBox(label:
            HStack {
                Text(title)
                Spacer()
                if bookmarked {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(Color.red)
                }
            }
        ) {
            VStack {
                HStack {
                    Text(content)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    JournalCard(title: "testing", content: "1, 2, 3...", bookmarked: true)
}
