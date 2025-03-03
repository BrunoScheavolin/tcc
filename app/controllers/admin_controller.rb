class AdminController < ApplicationController
  before_action -> { authorize(:admin, :admin) }
end
