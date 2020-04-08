class Api::ParamsController < ApplicationController
  def index
    render "show_name.json.jb"
  end
end
