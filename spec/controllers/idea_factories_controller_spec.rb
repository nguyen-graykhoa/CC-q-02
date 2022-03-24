require 'rails_helper'

RSpec.describe IdeaFactoriesController, type: :controller do
    describe "#new" do
        before do
            session[:user_id] = FactoryBot.create(:user).id
        end
         
        it "requires a render of a new template" do
          get(:new)        
          expect(response).to(render_template(:new))
        end #render new template

        it "requires setting an instance variable with a new factory idea" do        
            get(:new)
            expect(assigns(:idea_factory)).to(be_a_new(IdeaFactory))
        end # new instance var       

    end #new suite

    describe "#create" do
        def valid_request
            post(:create, params: { idea_factory: 
              FactoryBot.attributes_for(:idea_factory)
            })
        end

        context "with signed in user" do
            before do
               session[:user_id] = FactoryBot.create(:user).id
            end      
            
            context "with valid parameters" do
                it "requires a new creation of idea factory in the database" do
                    #GIVEN
                   count_before = IdeaFactory.count  

                    #WHEN
                    valid_request  

                    #THEN
                    count_after = IdeaFactory.count
                    expect(count_after).to(eq(count_before + 1))
                     
                end              
                
                it "requires a redirect to the show page for the new idea factory" do  
                    #WHEN
                    valid_request #mocking a post request to the create method with valid params

                    #THEN
                    idea_factory = IdeaFactory.last
                    expect(response).to(redirect_to(idea_factory_path(idea_factory.id)))
                end               

            end #valid params
            
            context "with invalid parameters" do
                def invalid_request
                    post(:create, params: { idea_factory: 
                        FactoryBot.attributes_for(:idea_factory, title:nil)
                    })
                end #invalid-request  

                it "requires that the database does not save the new invalid idea_factory" do
                    #GIVEN
                    count_before = IdeaFactory.count  
                    #WHEN
                    invalid_request #mocking a post request to the create method with invalid params
                    #THEN
                    count_after = IdeaFactory.count
                    expect(count_after).to(eq(count_before))                    
                end #doesn't save invalid               

                it "requires a render of the new idea factory template" do
                    invalid_request
                    #THEN
                    expect(response).to render_template(:new)
                end #render new              

            end #in-valid params            
        end #sign-in

        context "without signed in user" do
            it "should redirect to the sign in page" do
                valid_request
                expect(response).to redirect_to(new_sessions_path) 
            end        
        end #without sign-in
    end #create

end
