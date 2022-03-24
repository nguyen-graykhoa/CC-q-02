class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea_factory

    def create
        @review = Review.new(params.require(:review).permit(:body))
        @review.idea_factory = @idea_factory;
        @review.user = current_user
        if @review.save
            redirect_to idea_factory_path(@idea_factory.id), status: 303
        else
            @reviews = @idea_factory.reviews
            render '/idea_factories/show', status: 303
        end
        
    end    

    def destroy
        @review = Review.find params[:id]

        if can?(:crud, @review)
            @review.destroy
            redirect_to idea_factory_path(@review.idea_factory)
        else
            redirect_to root_path, alert: "Not Authorized"
        end
    end   

    private

    def find_idea_factory
        @idea_factory = IdeaFactory.find params[:idea_factory_id]
    end    
end
