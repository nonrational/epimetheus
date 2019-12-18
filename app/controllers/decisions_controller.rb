# frozen_string_literal: true

class DecisionsController < ApplicationController
  def index
    @decisions = Decision.all
  end
end
