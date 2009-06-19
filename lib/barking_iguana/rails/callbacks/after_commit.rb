module BarkingIguana
  module Rails
    module Callbacks
      module AfterCommit
        def self.included(base)
          base.send(:define_callbacks, :after_commit)
          base.send(:include, InstanceMethods)
          base.send(:alias_method_chain, :save, :after_commit_callback)
          base.send(:alias_method_chain, :save!, :after_commit_callback)
          base.send(:alias_method_chain, :destroy, :after_commit_callback)
        end

        module InstanceMethods
          def save_with_after_commit_callback(*args)
            value = save_without_after_commit_callback(args)
            callback(:after_commit) if value
            value
          end

          def save_with_after_commit_callback!(*args)
            value = save_without_after_commit_callback!
            callback(:after_commit) if value
            value
          end

          def destroy_with_after_commit_callback
            value = destroy_without_after_commit_callback
            callback(:after_commit) if value
            value
          end
        end
      end
    end
  end
end