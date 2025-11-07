The Repository contains the assignment in SwiftUI

/ A landing screen that showcases trending visa destinations, collects a phone number,
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
