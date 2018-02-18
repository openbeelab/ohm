class StaticPagesController < ApplicationController
  layout 'website', :only => [ :home, :about ]

  def home
  end

  def about
  end
end
