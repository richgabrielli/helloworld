import Vapor
import LeafProvider

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "<html><h1>Hello, Big World!</h1></html>"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        get("helloworld") {req in
            return try self.view.make("hello1")
        }

        get("secondpage") {req in return try self.view.make("secondpage") }

        try resource("posts", PostController.self)
    }
}

