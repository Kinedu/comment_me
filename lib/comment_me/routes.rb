module ActionDispatch::Routing
  class Mapper

    # => Inserting routes for comments_controller
    #
    # Example: 
    #
    # Rails.application.routes.draw do
    #
    #   comment_me
    # end
    #
    def comment_me
      scope :operations, defaults: { format: :json } do
        scope :comment_me do
          scope :comments do
            resources :comments, path: :/
          end
        end
      end
    end
  end
end
