//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import MapKit
import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(id: UUID(), title: "Event 1", description: "Description 1", latitude: 45.76708, longitude: 4.84157, creator: "Creator 1"),
        Event(id: UUID(), title: "Event 2", description: "Description 2", latitude: 45.76633, longitude: 4.83176, creator: "Creator 2"),
        Event(id: UUID(), title: "Event à Nîmes", description: "Description à Nîmes", latitude: 43.8367, longitude: 4.3601, creator: "Creator Nîmes"),
        Event(id: UUID(), title: "Event à Toulouse", description: "Description à Toulouse", latitude: 43.6047, longitude: 1.4442, creator: "Creator Toulouse"),
        Event(id: UUID(), title: "Event à Nice", description: "Description à Nice", latitude: 43.7102, longitude: 7.2620, creator: "Creator Nice"),
        Event(id: UUID(), title: "Event à Montpellier", description: "Description à Montpellier", latitude: 43.6108, longitude: 3.8767, creator: "Creator Montpellier"),
        Event(id: UUID(), title: "Event 3", description: "Description 3", latitude: 48.8566, longitude: 2.3522, creator: "Creator 3"),
        Event(id: UUID(), title: "Event 4", description: "Description 4", latitude: 51.5099, longitude: -0.1180, creator: "Creator 4"),
        Event(id: UUID(), title: "Event à Marseille", description: "Description à Marseille", latitude: 43.2965, longitude: 5.3698, creator: "Creator Marseille"),
        Event(id: UUID(), title: "Event à Lyon", description: "Description à Lyon", latitude: 45.75, longitude: 4.85, creator: "Creator Lyon"),
        Event(id: UUID(), title: "Event à Bordeaux", description: "Description à Bordeaux", latitude: 44.8378, longitude: -0.5792, creator: "Creator Bordeaux"),
        Event(id: UUID(), title: "Event à Lille", description: "Description à Lille", latitude: 50.6292, longitude: 3.0573, creator: "Creator Lille"),
        Event(id: UUID(), title: "Event à Strasbourg", description: "Description à Strasbourg", latitude: 48.5734, longitude: 7.7521, creator: "Creator Strasbourg"),
        Event(id: UUID(), title: "Event à Rennes", description: "Description à Rennes", latitude: 48.1173, longitude: -1.6778, creator: "Creator Rennes"),
        Event(id: UUID(), title: "Event à Nantes", description: "Description à Nantes", latitude: 47.2184, longitude: -1.5536, creator: "Creator Nantes"),
        Event(id: UUID(), title: "Event à Grenoble", description: "Description à Grenoble", latitude: 45.1885, longitude: 5.7245, creator: "Creator Grenoble"),
        Event(id: UUID(), title: "Event à Dijon", description: "Description à Dijon", latitude: 47.3220, longitude: 5.0415, creator: "Creator Dijon"),
        Event(id: UUID(), title: "Event à Avignon", description: "Description à Avignon", latitude: 43.9493, longitude: 4.8055, creator: "Creator Avignon"),
        Event(id: UUID(), title: "Event à Reims", description: "Description à Reims", latitude: 49.2583, longitude: 4.0317, creator: "Creator Reims"),
        Event(id: UUID(), title: "Event à Rouen", description: "Description à Rouen", latitude: 49.4432, longitude: 1.0999, creator: "Creator Rouen"),
        Event(id: UUID(), title: "Event à Clermont-Ferrand", description: "Description à Clermont-Ferrand", latitude: 45.7772, longitude: 3.0816, creator: "Creator Clermont-Ferrand"),
        Event(id: UUID(), title: "Event à Nancy", description: "Description à Nancy", latitude: 48.6921, longitude: 6.1844, creator: "Creator Nancy"),
        Event(id: UUID(), title: "Event à Metz", description: "Description à Metz", latitude: 49.1193, longitude: 6.1757, creator: "Creator Metz"),
        Event(id: UUID(), title: "Event à Toulon", description: "Description à Toulon", latitude: 43.1242, longitude: 5.9280, creator: "Creator Toulon"),
        Event(id: UUID(), title: "Event à Aix-en-Provence", description: "Description à Aix-en-Provence", latitude: 43.5297, longitude: 5.4474, creator: "Creator Aix-en-Provence"),
        Event(id: UUID(), title: "Event à Saint-Étienne", description: "Description à Saint-Étienne", latitude: 45.4397, longitude: 4.3872, creator: "Creator Saint-Étienne"),
        Event(id: UUID(), title: "Festival de Musique", description: "Un festival de musique avec des artistes locaux et internationaux. Venez passer une soirée inoubliable!", latitude: 48.8588, longitude: 2.2944, creator: "Organisateur Musique"),
        Event(id: UUID(), title: "Conférence Technologique", description: "Une conférence sur les dernières avancées technologiques. Explorez l'avenir de la technologie avec des experts de l'industrie.", latitude: 51.5074, longitude: -0.1278, creator: "Organisateur Tech"),
        Event(id: UUID(), title: "Balade à Vélo", description: "Une balade à vélo relaxante à travers la campagne. Profitez du grand air et faites de nouvelles rencontres!", latitude: 40.7128, longitude: -74.0060, creator: "Organisateur Vélo"),
        Event(id: UUID(), title: "Soirée Gastronomique", description: "Dégustation de plats exquis préparés par des chefs renommés. Une expérience culinaire unique à ne pas manquer!", latitude: 48.8566, longitude: 2.3522, creator: "Chef Cuisinier"),
        Event(id: UUID(), title: "Tournoi de Jeux Vidéo", description: "Affrontez d'autres joueurs dans un tournoi de jeux vidéo. Des prix excitants et une atmosphère compétitive vous attendent!", latitude: 34.0522, longitude: -118.2437, creator: "Organisateur Jeux Vidéo"),
        Event(id: UUID(), title: "Séance de Yoga en Plein Air", description: "Une séance apaisante de yoga en plein air. Reconnectez-vous avec votre corps et votre esprit dans un cadre naturel.", latitude: 37.7749, longitude: -122.4194, creator: "Instructeur Yoga"),
        Event(id: UUID(), title: "Exposition d'Art Contemporain", description: "Explorez des œuvres d'art contemporain créées par des artistes émergents. Une immersion dans la créativité moderne.", latitude: 45.4642, longitude: 9.1900, creator: "Curateur d'Art"),
        Event(id: UUID(), title: "Randonnée en Montagne", description: "Une aventure de randonnée en montagne avec des vues à couper le souffle. Préparez-vous à vivre une expérience en pleine nature.", latitude: 47.6062, longitude: -122.3321, creator: "Guide de Montagne"),
        Event(id: UUID(), title: "Cours de Photographie", description: "Apprenez les bases de la photographie avec un photographe professionnel. Capturez des moments spéciaux avec votre appareil.", latitude: 51.1657, longitude: 10.4515, creator: "Photographe Instructeur"),
        Event(id: UUID(), title: "Foire Artisanale", description: "Découvrez des produits artisanaux uniques et rencontrez les artisans derrière ces créations exceptionnelles.", latitude: 41.8781, longitude: -87.6298, creator: "Organisateur Artisanat"),
        Event(id: UUID(), title: "Spectacle de Magie", description: "Un spectacle de magie fascinant qui émerveillera petits et grands. Préparez-vous à être éblouis par des tours incroyables!", latitude: 52.5200, longitude: 13.4050, creator: "Magicien Étonnant"),
        Event(id: UUID(), title: "Cours de Danse Latino", description: "Apprenez les mouvements passionnés de la danse latino. Une soirée rythmée de salsa, bachata et merengue.", latitude: 25.7617, longitude: -80.1918, creator: "Instructeur de Danse"),
        Event(id: UUID(), title: "Course de Voiliers", description: "Participez à une passionnante course de voiliers sur les eaux scintillantes. Un défi nautique pour les amateurs de voile.", latitude: 35.6895, longitude: 139.6917, creator: "Skipper Expérimenté"),
        Event(id: UUID(), title: "Festival du Cinéma Indépendant", description: "Découvrez des films indépendants innovants et discutez avec des cinéastes talentueux lors de ce festival du cinéma.", latitude: 34.0522, longitude: -118.2437, creator: "Organisateur Cinéma"),
        Event(id: UUID(), title: "Atelier de Poterie", description: "Laissez libre cours à votre créativité lors d'un atelier de poterie. Modelez et créez des œuvres uniques avec l'aide d'un potier expert.", latitude: 40.7128, longitude: -74.0060, creator: "Potier Inspirant"),
        Event(id: UUID(), title: "Rencontre Littéraire", description: "Une rencontre littéraire avec des auteurs renommés. Explorez l'univers des livres et discutez avec les esprits créatifs derrière les histoires.", latitude: 51.5099, longitude: -0.1180, creator: "Écrivain Célèbre"),
        Event(id: UUID(), title: "Tournoi de Basketball", description: "Participez à un tournoi de basketball intense. Affrontez d'autres équipes pour remporter le trophée du championnat.", latitude: 37.7749, longitude: -122.4194, creator: "Organisateur Sportif"),
        Event(id: UUID(), title: "Séance de Méditation Guidée", description: "Une séance de méditation guidée pour apaiser l'esprit et cultiver la pleine conscience. Reconnectez-vous avec votre essence intérieure.", latitude: 48.8566, longitude: 2.3522, creator: "Instructeur de Méditation"),
        Event(id: UUID(), title: "Parcours d'Escalade en Plein Air", description: "Un parcours d'escalade palpitant en plein air. Défiez-vous et profitez de l'adrénaline tout en explorant la nature.", latitude: 34.0522, longitude: -118.2437, creator: "Guide d'Escalade"),
        Event(id: UUID(), title: "Tour en Montgolfière", description: "Voyagez dans les cieux lors d'un tour en montgolfière. Profitez d'une vue panoramique exceptionnelle pendant ce vol tranquille.", latitude: 51.1657, longitude: 10.4515, creator: "Pilote de Montgolfière"),


    ]
}


