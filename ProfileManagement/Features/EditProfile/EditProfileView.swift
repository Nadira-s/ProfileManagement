//
//  EditProfileView.swift
//  ProfileManagement
//
//  Created by Nadira Seitkazy  on 22.01.2026.
//

import SwiftUI

struct EditProfileView: View {
    
    @ObservedObject var viewModel: EditProfileViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            AvatarView(image: viewModel.avatarImage, size: 120)
            
            HStack{
                SecondaryButton(title:Strings.EditProfile.button1) {
                    viewModel.changePhotoFromGallery()
                }
                
                SecondaryButton(title: Strings.EditProfile.button2) {
                    viewModel.changePhotoFromCamera()
                }
            }
           
        
        .sheet(isPresented: $viewModel.showPicker) {
            ImagePickerWrapper(sourceType: viewModel.pickerSource) { image in
                viewModel.imagePicked(image)
            }
        }
        
        .sheet(isPresented: $viewModel.showCropper) {
            if let image = viewModel.avatarImage {
                CropViewWrapper(
                    image: image,
                    onCropped: { cropped in
                        viewModel.imageCropped(cropped)
                        viewModel.showCropper = false
                    },
                    onCancel: {
                        viewModel.showCropper = false
                    }
                )
            }
        }
        AppTextField(
            title: Strings.Profile.fullName,
            text: $viewModel.fullName
        ).onChange(of: viewModel.fullName) { _ in
            viewModel.validate()
        }
        if let error = viewModel.fullNameError {
            HStack {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                        Spacer()
                    }
        }

       
        
        AppTextField(
            title: Strings.Profile.email,
            text: .constant(viewModel.email),
            isDisabled: true
        )
        
        AppTextField(
            title: Strings.Profile.phone,
            text: $viewModel.phoneNumber
        ).onChange(of: viewModel.phoneNumber) { _ in
            viewModel.validate()
        }
        if let error = viewModel.phoneError {
            HStack {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                        Spacer()
                    }
                
        }
        
        PrimaryButton(
            title: Strings.EditProfile.save,
                isDisabled: !viewModel.isValid || viewModel.isSaving
        ) {
                viewModel.saveChanges()
        }
            
            SecondaryButton(title: Strings.EditProfile.cancel) {
            viewModel.cancelTapped()
        }
        
        if viewModel.isSaving {
            LoadingView()
        }
    }
        .padding()
        .navigationTitle(Strings.Profile.button)
    }
}

