# Cheat Sheet

## Decoding Data to JSON

    let data = Data(input.utf8)
    let decoder = JSONDecoder()
    if let user = try? decoder.decode(User.self, from: data) {
        print(user.address.street)
    }

## Working with UserDefaults

Saving data

    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
    
Retrieving data

    UserDefaults.standard.integer(forKey: "Tap")
    
## Working with APIs

    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
        print("Invalid URL")
        return
    }

    let request = URLRequest(url: url)

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.results = decodedResponse.results
                }
                return
            }
        }
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }.resume()

## Working with CoreData

    @Environment(\.managedObjectContext) var moc

    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    
    // Save latest data to CoreData
    try? moc.save()
    
## Tips & Tricks

### Dismiss a View

    @Environment(\.presentationMode) var presentationMode

    presentationMode.wrappedValue.dismiss()





