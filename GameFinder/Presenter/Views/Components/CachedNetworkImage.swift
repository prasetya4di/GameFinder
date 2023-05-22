//
//  CachedNetworkImage.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct CachedNetworkImage: View {
    @StateObject private var imageLoader: ImageLoader
    private let placeholderImage: Image
    
    init(imageURL: String, placeholder: Image = Image("NoImageFound")) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(imageURL: imageURL))
        placeholderImage = placeholder
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else if let error = imageLoader.error {
            placeholderImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .overlay(Text(error.localizedDescription)
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(4)
                    .padding(4))
        } else {
            Rectangle()
                .fill(.background)
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .top) {
                    ProgressView("Loading")
                }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var error: Error?
    
    private let imageURL: String
    private let cache = ImageCache.shared
    
    init(imageURL: String) {
        self.imageURL = imageURL
        loadImage()
    }
    
    private func loadImage() {
        if let cachedImage = cache.getImage(for: imageURL) {
            image = cachedImage
        } else {
            guard let url = URL(string: imageURL) else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.error = error
                    }
                } else if let data = data, let loadedImage = UIImage(data: data) {
                    self?.cache.setImage(loadedImage, for: self?.imageURL ?? "")
                    DispatchQueue.main.async {
                        self?.image = loadedImage
                    }
                }
            }.resume()
        }
    }
}

class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func setImage(_ image: UIImage, for key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(for key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
