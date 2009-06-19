require File.dirname(__FILE__) + '/barking_iguana/rails/callbacks/after_commit'

ActiveRecord::Base.send(:include, 
                        BarkingIguana::Rails::Callbacks::AfterCommit)