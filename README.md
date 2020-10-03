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
    
