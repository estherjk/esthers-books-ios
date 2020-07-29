//
//  BookList.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookList: View {
    var books: [Book] = []
    
    var body: some View {
        NavigationView {
            
            List {
                HStack() {
                    Spacer()
                    Text("\(books.count) Books")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                // ForEach works with identifiable data. Pass trello_id since this is unique.
                ForEach(books, id: \.trello_id) { book in
                    NavigationLink(destination: BookDetail(book: book)) {
                        BookRow(book: book)
                    }
                }
            }
            .navigationTitle("Books")
            
            Text("Select a book")
                .font(.largeTitle)
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(books: sampleBooksData)
    }
}