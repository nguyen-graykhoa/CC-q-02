require 'rails_helper'

RSpec.describe IdeaFactoriesController, type: :controller do
    describe "#new" do
        it "requires a render of a new template" do
          get(:new)        
          expect(response).to(render_template(:new))
        end #render new template

        it "requires setting an instance variable with a new factory idea" do        
            get(:new)
            expect(assigns(:idea_factory)).to(be_a_new(IdeaFactotry))
        end # new instance var       

    end # new suite
end
