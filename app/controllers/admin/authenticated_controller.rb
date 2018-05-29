class Admin::AuthenticatedController < ApplicationController
  before_filter :require_user
end


#Si queremos probar los test, comentar la lineade before_filter