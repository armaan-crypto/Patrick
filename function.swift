func getToken(u: String, p: String) async throws -> String {

    let parameters = "grant_type=password&username=\(u)&password=\(p)&scope=read&client_id=5COdt65uc9h4odgqtbGbxwKGFBPapjfcq0WvqNAP&client_secret=O0NQnCFHkDblfFQvikbz5VHD0UXyzsfLZ6jWtJgJkyD4rjlHL1FTZCzdB0kPrTgNyqlHtkyjkWuzVMrkiZBaTADKIG4qCHSpd4bAZmOGeD5KH8DdXBy3xrxm3iFPZXKR"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: "https://ion.tjhsst.edu/oauth/token")!,timeoutInterval: Double.infinity)
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.addValue("csrftoken=mNqItfdbrnDIjS1csGPfDTFozWorTnmpCmo9x4MilOAp9X1ke85JZQH5DayABOPY; dark-mode-enabled=0; sessionid=bnnq9psnzlxi3o43uqw46aelegn6x6le", forHTTPHeaderField: "Cookie")

    request.httpMethod = "POST"
    request.httpBody = postData

    let (data, _) = try await URLSession.shared.data(for: request)
    let token = try JSONDecoder().decode(Token.self, from: data)
    return token.accessToken
}