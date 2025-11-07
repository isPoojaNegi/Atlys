//
//  LandingView.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//


// A landing screen that showcases trending visa destinations, collects a phone number,
/// and offers social sign-in options.
///
/// Layout:
/// - Header: Brand title and subtitle.
/// - Carousel: Horizontally swipeable destination cards with scaling and paging dots.
/// - Messaging: "Get Visas / On Time" headline.
/// - Phone input: Inline country code and phone number field styled as a single control.
/// - Primary action: Continue button.
/// - Social login: Google, Apple, and Email icon buttons.
/// - Legal: Terms and privacy text.
///
/// Interactions:
/// - Swipe horizontally on the carousel to move between destinations.
/// - Page dots reflect the current index.
/// - Phone field is keyboard-enabled for phone input.
/// - Continue and social buttons are tappable (handlers are placeholders in this view).
///
/// State:
/// - `currentIndex`: The currently focused destination in the carousel.
/// - `dragOffset`: Gesture state tracking the horizontal drag during swipes.
/// - Observes `LandingViewModel` for `destinations` and `errorMessage`.
///
/// Dependencies:
/// - `LandingViewModel`: Provides destinations, error state, and `loadContent()`.
/// - `VisaDestination`: Model used by the carousel cards.
/// - `DestinationCard`: Visual representation of a destination.
/// - `SocialIconButton`: Square icon button for social sign-in.
/// - `TermsPrivacyText`: Inline legal text with links.
///
/// Behavior:
/// - On appear, triggers `viewModel.loadContent()` (also called in the view model init).
/// - Carousel uses a spring animation and scales non-focused cards for depth.
/// - Carousel swipe threshold is 20% of available width.
///
/// - Note: Networking is mocked in `LandingViewModel.loadContent()`. Replace with real API calls as needed.


import SwiftUI

struct LandingView: View {
    @StateObject var viewModel: LandingViewModel
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            
            VStack(spacing: 0) {
                VStack(spacing: 4) {
                    Text("atlys")
                        .font(.largeTitle)
                        .bold()
                    Text("visas on time")
                        .font(.caption)
                        .foregroundColor(.purple)
                }
                .padding(.top, 16)

                Spacer()

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    VStack(spacing: 20) {
                        GeometryReader { geo in
                            let screenWidth = geo.size.width

                            ZStack {
                                ForEach(viewModel.destinations.indices, id: \.self) { index in
                                    let destination = viewModel.destinations[index]
                                    let offset = CGFloat(index - currentIndex) * 220 + dragOffset

                                    // Dynamic scale (gentle curve)
                                    let normalizedOffset = abs(offset) / screenWidth
                                    let scale = max(0.8, 1 - normalizedOffset * 0.3)

                                    DestinationCard(destination: destination)
                                        .frame(width: 250 * scale, height: 250 * scale)
                                        .offset(x: offset)
                                        .zIndex(Double(1 - abs(offset) / 500))
                                        .animation(.spring(response: 0.45, dampingFraction: 0.8), value: currentIndex)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .gesture(
                                DragGesture()
                                    .updating($dragOffset) { value, state, _ in
                                        state = value.translation.width
                                    }
                                    .onEnded { value in
                                        let threshold = screenWidth * 0.2
                                        if value.translation.width < -threshold {
                                            currentIndex = min(currentIndex + 1, viewModel.destinations.count - 1)
                                        } else if value.translation.width > threshold {
                                            currentIndex = max(currentIndex - 1, 0)
                                        }
                                    }
                            )
                        }
                        .frame(height: 250)

                        HStack(spacing: 8) {
                            ForEach(viewModel.destinations.indices, id: \.self) { index in
                                Circle()
                                    .fill(index == currentIndex ? Color.purple : Color.gray.opacity(0.3))
                                    .frame(width: 8, height: 8)
                            }
                        }
                        .padding(.top, 10)
                    }
                }

                Spacer()

                Group {
                    Text("Get Visas")
                    Text("On Time")
                }
                .font(.largeTitle)
                .bold()

                HStack(alignment: .center) {
                    Text("🇮🇳 +91")
                    Divider()
                    TextField("Enter mobile number", text: .constant(""))
                        .keyboardType(.phonePad)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .frame(height: 50)
                .padding(.horizontal, 16)
                .padding(.top, 16)

                Button("Continue") {}
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                Text("or")
                    .foregroundColor(.gray)
                    .padding(.vertical, 2)

                HStack(spacing: 24) {
                    SocialIconButton(image: Image("google")) {}
                    SocialIconButton(image: Image("apple")) {}
                    SocialIconButton(image: Image("email")) {}
                }
                .padding(.top, 4)

                TermsPrivacyText()
                    .padding(.top, 6)
                    .padding(.horizontal,10)
            }
            .frame(width: screenWidth)
            .ignoresSafeArea(.keyboard)
        }
        .onAppear {
            viewModel.loadContent()
        }
    }
}

