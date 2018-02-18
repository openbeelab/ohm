class StaticPagesController < ApplicationController
  layout 'static_pages', :only => [ :cgu ]

  def home
    render layout: "homepage"
  end

  def cgu
  end
end
