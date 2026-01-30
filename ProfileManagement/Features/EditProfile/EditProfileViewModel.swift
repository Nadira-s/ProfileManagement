//
//  EditProfileViewModel.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI
import Combine

class EditProfileViewModel: ObservableObject {
    @Published var fullName: String
    @Published var phoneNumber: String
    @Published var avatarData: Data?
    let email: String
    @Published var fullNameError: String?
    @Published var phoneError: String?
    
    @Published var isSaving = false
    @Published var errorMessage: String?
    
    @Published var avatarImage: UIImage?

    @Published var showPicker = false
    @Published var showCropper = false

    private let originalProfile: Profile
    private let persistenceService: PersistenceService
    private let router: AppRouter
    private let pickerService: ImagePickerServiceProtocol
    private let cropService: ImageCropServiceProtocol
    
    var pickerSource: UIImagePickerController.SourceType = .photoLibrary
    
  

    init(
        profile: Profile,
        persistenceService: PersistenceService,
        router: AppRouter,
        pickerService: ImagePickerServiceProtocol,
        cropService: ImageCropServiceProtocol
    ) {
        self.originalProfile = profile
        self.persistenceService = persistenceService
        self.router = router
        self.pickerService = pickerService
        self.cropService = cropService
        
        self.fullName = profile.fullName
        self.phoneNumber = profile.phoneNumber
        self.email = profile.email
        if let data = profile.avatarData {
               self.avatarImage = UIImage(data: data)
           } else {
               self.avatarImage = nil
           }
        
    }
    

    func changePhotoFromGallery() {
        pickerSource = .photoLibrary
        showPicker = true
    }

    func changePhotoFromCamera() {
        pickerSource = .camera
        showPicker = true
    }

    func imagePicked(_ image: UIImage) {
        avatarImage = image
        showCropper = true
    }

    func imageCropped(_ image: UIImage) {
        avatarImage = image
        avatarData = image.jpegData(compressionQuality: 0.8)
    }

    var isValid: Bool {
           fullName.trimmingCharacters(in: .whitespaces).isEmpty == false &&
           phoneNumber.allSatisfy { $0.isNumber }
       }
    
    func validate() {
        if fullName.trimmingCharacters(in: .whitespaces).isEmpty {
            fullNameError = Strings.Validator.validateFullName
        } else {
            fullNameError = nil
        }

        if phoneNumber.isEmpty || !phoneNumber.allSatisfy({ $0.isNumber }) {
            phoneError = Strings.Validator.validatePhone2
        } else {
            phoneError = nil
        }
    }

        
    func saveChanges() {
        validate()
        guard isValid else { return }

        isSaving = true

        originalProfile.fullName = fullName
        originalProfile.phoneNumber = phoneNumber

        if let image = avatarImage {
            originalProfile.avatarData = image.jpegData(compressionQuality: 0.8)
        }

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            do {
                try self.persistenceService.save(self.originalProfile)
                
                DispatchQueue.main.async {
                    self.isSaving = false
                    self.router.pop()
                }
            } catch {
                DispatchQueue.main.async {
                    self.isSaving = false
                    self.errorMessage = Strings.Validator.validateEmail
                }
            }
        }
    }



    func cancelTapped() {
        router.pop()
    }
}
