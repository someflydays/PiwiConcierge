import SwiftUI

struct HeaderView: View {
    var userName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome back, \(userName)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top)

                Text("What would you like to discover today?")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(userName: "Derek")
    }
}
