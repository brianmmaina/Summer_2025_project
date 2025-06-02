import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  @State private var isLoggingIn = false
  @State private var errorMessage: String?
  @State private var isLoggedIn = false

  private var isEmailValid: Bool {
    email.range(of: #"^\S+@\S+\.\S+$"#, options: .regularExpression) != nil
  }

  private var isFormValid: Bool {
    !email.isEmpty && !password.isEmpty && isEmailValid
  }

  var body: some View {
    if isLoggedIn {
      // replace this with your TabView or HomeView later
      Text("✅ Logged in!")
    } else {
      VStack(spacing: 16) {
        Text("Log In").font(.largeTitle).bold()

        VStack(spacing: 12) {
          TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)

          SecureField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)

        if let msg = errorMessage {
          Text(msg)
            .foregroundColor(.red)
            .font(.caption)
        }

        Button(action: attemptLogin) {
          if isLoggingIn {
            ProgressView()
          } else {
            Text("Log In")
              .frame(maxWidth: .infinity)
              .padding()
              .background(isFormValid ? Color.accentColor : Color.gray)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
        }
        .disabled(!isFormValid || isLoggingIn)
        .padding(.horizontal)

        Spacer()

        NavigationLink("Forgot Password?", destination: ForgotPasswordView())
          .font(.footnote)
          .padding(.top, 8)

        NavigationLink("Don’t have an account? Sign Up", destination: SignUpView())
          .font(.footnote)
          .padding(.top, 4)
      }
      .padding(.top, 40)
    }
  }

  private func attemptLogin() {
    isLoggingIn = true
    errorMessage = nil
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      isLoggingIn = false
      if email.lowercased() == "test@example.com" && password == "password" {
        isLoggedIn = true
      } else {
        errorMessage = "Invalid email or password."
      }
    }
  }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .previewDevice("iPhone 16")
  }
}
#endif

