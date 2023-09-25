//
//  ContentView.swift
//  TebakAngkasIOS
//
//  Created by Pieter Yoshua Natanael on 25/09/23.
//

import SwiftUI


struct NumberWizardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var userGuess = ""
    @State private var message = ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("TebakAngka")
                .font(.headline)
                .padding()

            Text("Tebak 1-100")
                .font(.subheadline)
                .padding()

            TextField("Masukan Tebakan mu", text: $userGuess)
                .padding()

            Button("Kirim Tebakan") {
                checkGuess()
            }
            .padding()

            Text(message)
                .font(.subheadline)
                .foregroundColor(messageColor())
                .padding()

        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Selamat!"),
                message: Text("Kamu menebak  \(targetNumber)!"),
                dismissButton: .default(Text("Main Lagi")) {
                    resetGame()
                }
            )
        }
    }

    func checkGuess() {
        guard let guess = Int(userGuess) else {
            message = "Masukan tebakan yang benar"
            return
        }

        if guess < 1 || guess > 100 {
            message = "Masukan pilihan 1 sampai 100."
        } else if guess == targetNumber {
            message = "Selamat! Tebakan benar \(targetNumber)!"
            showAlert = true
        } else if guess < targetNumber {
            message = "Coba lebih tinggi"
        } else {
            message = "Coba lebih rendah"
        }
    }

    func resetGame() {
        targetNumber = Int.random(in: 1...100)
        userGuess = ""
        message = ""
    }

    func messageColor() -> Color {
        if message.contains("Selamat") {
            return .green
        } else {
            return .red
        }
    }
}


/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
