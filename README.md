# Cheat Sheet

## Decoding Data to JSON

    let data = Data(input.utf8)
    let decoder = JSONDecoder()
    if let user = try? decoder.decode(User.self, from: data) {
        print(user.address.street)
    }

## Working with UserDefaults

### Saving data

    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
    
### Retrieving data

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
    
## Working with Biometrics

    Import LocalAuthentication

    let authContext = LAContext()
    var error : NSError?

    if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

      authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authentication Required") {       (success, error) in
        if success == true {
          DispatchQueue.main.async {
            //Correct Biometric
          }
        } else {
          DispatchQueue.main.async {
            //Wrong Biometric
          }
        }
      }
    }
    
## Send User Notification

    import UserNotifications

### Ask for permission to send notifs

    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("All set!")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }

### Schedule Notifs

    let content = UNMutableNotificationContent()
    content.title = "Feed the cat"
    content.subtitle = "It looks hungry"
    content.sound = UNNotificationSound.default

    // show this notification five seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

    // choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    // add our notification request
    UNUserNotificationCenter.current().add(request)
    
## Generate QR Code

    import CoreImage.CIFilterBuiltins

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
### Function to generate QR Code

    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
   
### Showing QR Code in the view

    Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
        .interpolation(.none)
        .resizable()
        .scaledToFit()
        .frame(width: 200, height: 200)
    
## Tips & Tricks

### Dismiss a View

    @Environment(\.presentationMode) var presentationMode

    presentationMode.wrappedValue.dismiss()
    
### Adding context menu

    .contextMenu {
        Button(action: {
            // Do something
        }) {
            Text("Red")
        }

        Button(action: {
            // Do something
        }) {
            Text("Green")
        }

        Button(action: {
            // Do something
        }) {
            Text("Blue")
        }
    }

### TabView and NavView

It’s common to want to use NavigationView and TabView at the same time, but you should be careful: TabView should be the parent view, with the tabs inside it having a NavigationView as necessary, rather than the other way around.





