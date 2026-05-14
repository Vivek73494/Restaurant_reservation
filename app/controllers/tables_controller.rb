class TablesController < ApplicationController
  before_action :require_login

  def index
    @tables = Table.all.order(:table_number)
  end
end
