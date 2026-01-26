import UIKit
import Mantis
import SwiftUI

protocol ImageCropServiceProtocol {
    func makeCropController(
        image: UIImage,
        onCropped: @escaping (UIImage) -> Void
    ) -> UIViewController
}

final class ImageCropService: NSObject,
                              ImageCropServiceProtocol,
                              CropViewControllerDelegate {

    private var onCropped: ((UIImage) -> Void)?

    func makeCropController(
        image: UIImage,
        onCropped: @escaping (UIImage) -> Void
    ) -> UIViewController {

        self.onCropped = onCropped

        var config = Mantis.Config()
        config.cropShapeType = .circle(maskOnly: false)

        let cropVC = Mantis.cropViewController(
            image: image,
            config: config
        )

        cropVC.delegate = self
        return cropVC
    }

    func cropViewControllerDidCrop(
        _ cropViewController: CropViewController,
        cropped: UIImage,
        transformation: Transformation,
        cropInfo: CropInfo
    ) {
        cropViewController.dismiss(animated: true)
        onCropped?(cropped)
    }

    func cropViewControllerDidCancel(
        _ cropViewController: CropViewController,
        original: UIImage
    ) {
        cropViewController.dismiss(animated: true)
    }

    func cropViewControllerDidFailToCrop(
        _ cropViewController: CropViewController,
        original: UIImage
    ) {
        cropViewController.dismiss(animated: true)
    }

    func cropViewControllerDidBeginResize(
        _ cropViewController: CropViewController
    ) {}

    func cropViewControllerDidEndResize(
        _ cropViewController: CropViewController,
        original: UIImage,
        cropInfo: CropInfo
    ) {}
}

struct CropViewWrapper: UIViewControllerRepresentable {

    let image: UIImage
    let onCropped: (UIImage) -> Void
    let onCancel: () -> Void

    func makeUIViewController(context: Context) -> UIViewController {

        var config = Mantis.Config()
        config.cropShapeType = .circle(maskOnly: false)

        let vc = Mantis.cropViewController(
            image: image,
            config: config
        )

        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, CropViewControllerDelegate {

        let parent: CropViewWrapper

        init(_ parent: CropViewWrapper) {
            self.parent = parent
        }

        func cropViewControllerDidCrop(
            _ cropViewController: CropViewController,
            cropped: UIImage,
            transformation: Transformation,
            cropInfo: CropInfo
        ) {
            parent.onCropped(cropped)
        }

        func cropViewControllerDidCancel(
            _ cropViewController: CropViewController,
            original: UIImage
        ) {
            parent.onCancel()
        }

        func cropViewControllerDidFailToCrop(
            _ cropViewController: CropViewController,
            original: UIImage
        ) {
            parent.onCancel()
        }

        func cropViewControllerDidBeginResize(
            _ cropViewController: CropViewController
        ) {
           
        }

        func cropViewControllerDidEndResize(
            _ cropViewController: CropViewController,
            original: UIImage,
            cropInfo: CropInfo
        ) {
            
        }
    }
}
