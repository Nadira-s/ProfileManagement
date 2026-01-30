
import UIKit
import SwiftUI


protocol ImagePickerServiceProtocol {
    func makePicker(
        sourceType: UIImagePickerController.SourceType,
        onImagePicked: @escaping (UIImage) -> Void
    ) -> UIViewController
}

final class ImagePickerService: NSObject,
                                ImagePickerServiceProtocol,
                                UIImagePickerControllerDelegate,
                                UINavigationControllerDelegate {

    private var onImagePicked: ((UIImage) -> Void)?

    func makePicker(
        sourceType: UIImagePickerController.SourceType,
        onImagePicked: @escaping (UIImage) -> Void
    ) -> UIViewController {

        self.onImagePicked = onImagePicked

        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = self
        return picker
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        picker.dismiss(animated: true)

        if let image = info[.originalImage] as? UIImage {
            onImagePicked?(image)
        }
    }
}

struct ImagePickerWrapper: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    var didSelect: (UIImage) -> Void
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerWrapper
        init(parent: ImagePickerWrapper) { self.parent = parent }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.didSelect(image)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
