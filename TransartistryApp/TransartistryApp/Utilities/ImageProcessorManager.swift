//
//  ImageProcessorManager.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 10.01.2022.
//

import Foundation

protocol CameraImageProcesssor {
    func saveImageAsDataAtTemporaryDirectory(data: Data?) -> URL?
}

class ImageProcessorManager {
}

extension ImageProcessorManager: CameraImageProcesssor {
    func saveImageAsDataAtTemporaryDirectory(data: Data?) -> URL? {
        let imgName = UUID().uuidString
        let documentDirectory = NSTemporaryDirectory()
        let localPath = documentDirectory.appending(imgName)
        let photoURL = URL(fileURLWithPath: localPath)
        do {
            try data?.write(to: photoURL)
        } catch {
            return nil
        }
        return photoURL
    }
}
