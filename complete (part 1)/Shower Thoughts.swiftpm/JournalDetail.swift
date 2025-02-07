//
//  JournalDetail.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/6/25.
//

import SwiftUI

struct JournalDetail: View {
    var title: String
    var content: String
    var dateCreated: Date
    var dateModified: Date
    var bookmarked: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                if bookmarked {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(Color.red)
                } else {
                    Image(systemName: "bookmark")
                        .foregroundStyle(Color.red)
                }
            }
            .padding(.bottom)
            Text(content)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    JournalDetail(title: "Some title", content: "some body text", dateCreated: Date(), dateModified: Date(), bookmarked: true)
}
