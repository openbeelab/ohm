class StaticPagesController < ApplicationController
  layout 'static_pages', :only => [ :cgu, :contact ]

  def home
    render layout: "homepage"
  end

  def cgu
  end

  def contact
  end
end
