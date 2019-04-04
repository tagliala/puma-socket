class PagesController < ApplicationController
  def main
    render html: "<h1 style=\"text-align: center\">Hello from Puma</h1> <h2 style=\"text-align: center\">Ruby Version: #{RUBY_VERSION}</h2>".html_safe
  end
end
