import SwiftUI

struct ContentView: View {
    @State private var userChoice: String = ""
    @State private var computerChoice: String = ""
    @State private var result: String = ""

    private let choices = ["Rock", "Paper", "Scissors"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
                .fontWeight(.bold)

            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { choice in
                    Button(action: {
                        self.play(userChoice: choice)
                    }) {
                        Text(choice)
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }

            Text("You chose: \(userChoice)")
            Text("Computer chose: \(computerChoice)")
            Text(result)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(result == "You win!" ? .green : result == "You lose!" ? .red : .gray)
        }
        .padding()
    }

    func play(userChoice: String) {
        self.userChoice = userChoice
        self.computerChoice = choices.randomElement()!

        if userChoice == computerChoice {
            result = "It's a tie!"
        } else if (userChoice == "Rock" && computerChoice == "Scissors") ||
                  (userChoice == "Paper" && computerChoice == "Rock") ||
                  (userChoice == "Scissors" && computerChoice == "Paper") {
            result = "You win!"
        } else {
            result = "You lose!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
