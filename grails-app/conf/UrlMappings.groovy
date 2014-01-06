class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "home", action: "index")	//	The "home" controller is mapped as default because
													//un-logged-in people will always be redirected anyway
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
		"500"(view:'/error')
	}
}
	