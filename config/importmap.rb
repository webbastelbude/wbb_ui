pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
#pin_all_from File.expand_path("../app/assets/javascripts", __dir__)

pin "wbb_ui/application", to: "wbb_ui/application.js"
pin "wbb_ui/controllers", to: "wbb_ui/controllers/index.js"
pin_all_from File.expand_path("../app/assets/javascripts/wbb_ui/controllers", __dir__), under: "wbb_ui"