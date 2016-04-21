class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		name blankUri:"/" {
			controller="workspace"
			action="index"
		}
		"500"(view:'/error')
	}
}
