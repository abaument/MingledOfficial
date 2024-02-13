import SwiftUI
import MapKit

struct EventCreationView: View {
    @ObservedObject var eventData: EventData
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var locationDescription: String = ""
    @State private var feedback: String = ""
    @State private var capacity: String = ""
    @State private var practicalInfo: String = ""
    @State private var eventDate = Date()
    @State private var showingImagePicker = false
    @State private var selectedImages: [UIImage] = []
    @State private var showingLocationPicker = false
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @Environment(\.presentationMode) var presentationMode

    func saveImageAndGetPath(image: UIImage) -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return nil }
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = documentDirectory.appendingPathComponent(fileName)

        do {
            try imageData.write(to: fileURL)
            return fileURL.path
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails de l'événement")) {
                    TextField("Titre", text: $title)
                    TextField("Description", text: $description)
                    TextField("Description de l'emplacement", text: $locationDescription)
                    TextField("Feedback", text: $feedback)
                    TextField("Capacité", text: $capacity)
                    TextField("Infos pratiques", text: $practicalInfo)
                    DatePicker("Date de l'événement", selection: $eventDate, displayedComponents: .date)
                }

                Section {
                    Button("Sélectionner l'emplacement") {
                        showingLocationPicker = true
                    }
                    .sheet(isPresented: $showingLocationPicker) {
                        // Assurez-vous que LocationPickerView est correctement implémenté pour mettre à jour `selectedCoordinate`
                        LocationPickerView(selectedCoordinate: $selectedCoordinate)
                    }

                    if let coordinate = selectedCoordinate {
                        Text("Emplacement sélectionné: \(coordinate.latitude), \(coordinate.longitude)")
                    }
                }

                Section(header: Text("Images")) {
                    Button("Sélectionner des images") {
                        showingImagePicker = true
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        // Votre MultiImagePicker ici
                        MultiImagePicker(selectedImages: $selectedImages)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(selectedImages.indices, id: \.self) { index in
                                Image(uiImage: selectedImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .onTapGesture {
                                        selectedImages.remove(at: index)
                                    }
                            }
                        }
                    }
                }

                Section {
                    Button("Créer l'événement") {
                        guard let capacityInt = Int(capacity), !title.isEmpty, !description.isEmpty, let coordinate = selectedCoordinate else {
                            print("Validation Échouée")
                            return
                        }
                        let imagePaths = selectedImages.compactMap { saveImageAndGetPath(image: $0) }
                            let newEvent = Event(
                                id: UUID(),
                                title: title,
                                description: description,
                                latitude: coordinate.latitude,
                                longitude: coordinate.longitude,
                                creator: "DefaultCreator",
                                photos: imagePaths,
                                locationDescription: locationDescription,
                                feedback: [feedback],
                                capacity: capacityInt,
                                practicalInfo: practicalInfo,
                                eventDate: eventDate
                            )
                            eventData.events.append(newEvent)
                            presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Nouvel Événement", displayMode: .inline)
            .navigationBarItems(trailing: Button("Annuler") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
