// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//import "@hotwired/turbo-rails"
//import "controllers"

import Rails from "@rails/ujs"
import Turbolinks from 'turbolinks'
import * as ActiveStorage from "@rails/activestorage"
import 'channels/carriages.js'
//import "channels"

//require("@rails/ujs").start()
require("../.rvm/gems/ruby-3.0.1@rails-application/gems/turbolinks-source-5.2.0/lib/assets/javascripts/turbolinks").start()
//require("@rails/activestorage").start()
//require("channels")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function() { });