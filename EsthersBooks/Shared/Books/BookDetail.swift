//
//  BookDetail.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    // Format date inside text views
    // See https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-text-inside-text-views
    static let dateFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    let book: Book
    
    var body: some View {
        // TODO: Replace hard-coded data
        VStack(spacing: 5) {
            Spacer()
            
            BookCover(image: book.image)
                .padding(.bottom)
            
            Text(book.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
            
            Text("\(book.date_started, formatter: Self.dateFormatter) to \(book.date_finished, formatter: Self.dateFormatter)")
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct BookCover: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 300)
            .shadow(radius: 10)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: sampleBooksData[4])
    }
}
