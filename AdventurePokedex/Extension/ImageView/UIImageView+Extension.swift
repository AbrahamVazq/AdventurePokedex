//  UIImageView+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

extension UIImageView {
    
    func loadImage(strURL: String?) -> URLSessionDownloadTask? {
        guard let url = URL(string: strURL ?? "") else { return nil }
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url) { [weak self] url, response, error in
            guard let self = self else { return }
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async { self.image = image }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
    
}
