//
//  OnboardingView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-25.
//

import SwiftUI


struct OnBoardingStep {
    let image: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
}

private let onBoardingSteps = [
    OnBoardingStep(image: "img-intro1", title: LocalizedStringKey("onBoardingTitle1") , description: LocalizedStringKey("onBoardingDescription1")),
    OnBoardingStep(image: "img-intro2", title: LocalizedStringKey("onBoardingTitle2") , description: LocalizedStringKey("onBoardingDescription2")),
    OnBoardingStep(image: "img-intro3", title: LocalizedStringKey("onBoardingTitle3") , description: LocalizedStringKey("onBoardingDescription3"))
    
]

struct OnboardingView: View {
    @State private var currentStep = 0
    @ObservedObject var viewModel : AuthViewModel
    
    var body: some View {
        
//        NavigationView{
            VStack {
                Spacer()
                TabView(selection: $currentStep) {
                    ForEach(onBoardingSteps.indices, id:\.self) { step in
                        VStack {
                            Image(onBoardingSteps[step].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                            
                            Text(onBoardingSteps[step].title)
                                .font(.title)
                                .bold()
                                .padding()
                            
                            Text(onBoardingSteps[step].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                        }
                        .tag(step)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(onBoardingSteps.indices, id:\.self) { step in
                        if step == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        currentStep = step
                                    }
                                }
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        currentStep = step
                                    }
                                }
                        }
                    }
                }
                .padding(.bottom, 24)
                //            .padding(.top)
                //            Spacer()
                
                HStack {
                    NavigationLink(destination: LoginView(viewModel: viewModel)) {
                        Text(LocalizedStringKey("loginBtn"))
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                            .frame(maxWidth: 140, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: HomeView(viewModel: viewModel)) {
                        Text(LocalizedStringKey("exploreBtn"))
                            .foregroundColor(.black)
                            .bold()
                            .font(.headline)
                            .frame(maxWidth: 140, minHeight: 50)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                }
                .padding(.top)
                Spacer()
            }
//        } // NavigationView
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: AuthViewModel())
    }
}
