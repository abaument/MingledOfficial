import Foundation
import MapKit
import SwiftUI

struct EventCreationView: View {
    @ObservedObject var eventData: EventData
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var showingImagePicker = false
    @State private var selectedImages: [UIImage] = []
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails de l'événement")) {
                    TextField("Titre", text: $title)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Images")) {
                    Button("Sélectionner des images") {
                        showingImagePicker = true
                    }

                    ForEach(selectedImages, id: \.self) { img in
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                }

                Section {
                    Button("Créer l'événement") {
                        // Ajoutez la logique de création de l'événement ici
                    }
                }
            }
            .navigationBarTitle("Nouvel Événement", displayMode: .inline)
            .navigationBarItems(trailing: Button("Annuler") {
                presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $showingImagePicker) {
                PhotoLibraryPicker(selectedImages: $selectedImages)
            }
        }
    }
}
