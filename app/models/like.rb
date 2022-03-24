class Like < ApplicationRecord    
    belongs_to :user
    belongs_to :idea_factory 

    validates(:idea_factory_id, uniqueness:{scope: :user_id, message: "Has already been liked!"})
    
end