import SwiftUI

struct BookEditorView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        VStack {
            TextField("Title", text: $book.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Author", text: $book.author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Perform any actions needed when saving or updating the book
                print("Book updated: \(book.title) by \(book.author)")
            }) {
                Text("Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    @StateObject private var book = Book(title: "Sample Title", author: "Sample Author")
    
    var body: some View {
        BookEditorView(book: book)
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
