class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  Enceladus.connect("69e30e21886db05709448feb3bf8715b", {
     include_image_language: "pt", language: "en", include_adult: false })


end
