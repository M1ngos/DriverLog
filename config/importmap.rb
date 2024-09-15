# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
# pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"


 # # Pin Turbo (for Turbo Drive and Turbo Frames)
 # pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo@7.2.0/dist/turbo.min.js"
 # # Pin Stimulus (for Stimulus JS)
 pin "@hotwired/stimulus", to: "https://unpkg.com/@hotwired/stimulus@3.2.2/dist/stimulus.js"
# pin "@hotwired/stimulus-loading", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus-loading@1.2.0/dist/stimulus-loading.js"


# Pin controllers directory (make sure this path matches where your controllers are)
pin_all_from "app/javascript/controllers", under: "controllers"

# Pin Bootstrap (for Bootstrap JavaScript components)
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"

# TODO: FIND LIB'S
