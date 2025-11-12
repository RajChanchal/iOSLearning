//
//  BookShelf.swift
//  
//
//  Created by Chanchal Raj on 12/11/2025.
//

public class BookShelf {
    private var books: [Book] = []
    private let category: BookGenre
    
    init(category: BookGenre) {
        self.category = category
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func remove(book: Book) {
        books.removeAll { $0 == book }
    }
    
    func move(book: Book, to shelf: BookShelf) {
        remove(book: book)
        shelf.add(book: book)
    }
    
    func move(book: Book, from shelf: BookShelf){
        shelf.remove(book: book)
        add(book: book)
    }
}
