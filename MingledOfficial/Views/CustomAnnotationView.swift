//
//  CustomAnnotationView.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/01/2024.
//

import Foundation
import MapKit
import UIKit


class CustomAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let eventAnnotation = newValue as? EventAnnotation else { return }
            self.layer.cornerRadius = self.frame.size.width / 2 // Faites en sorte que le cornerRadius soit la moitié de la largeur de l'image pour créer un cercle parfait.
            self.clipsToBounds = true // Cela permet de s'assurer que l'image sera coupée pour s'adapter au cornerRadius défini.
            self.layer.borderWidth = 1.0 // Optionnel: ajoute une bordure fine autour du cercle pour le démarquer.
            self.layer.borderColor = UIColor.white.cgColor // Optionnel: définit la couleur de la bordure du cercle.
            
            // Assurez-vous que l'image est redimensionnée correctement avant de l'appliquer.
            let resizedImage = eventAnnotation.image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
            self.image = resizedImage?.withRoundedCorners(radius: self.frame.size.width / 2)
        }
    }
    
    // Initialiseur requis par Swift pour UIView
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Initialiseur personnalisé pour utiliser avec des annotations
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Assurez-vous que la vue est carrée pour le cercle parfait.
    }
}

extension UIImage {
    // Extension pour arrondir les coins de l'image, transformée pour s'adapter au nouveau besoin.
    func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0 && radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
