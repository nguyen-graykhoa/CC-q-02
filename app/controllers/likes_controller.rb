class LikesController < ApplicationController
    def create
        idea_factory = IdeaFactory.find params[:idea_factory_id]
        like = Like.new(idea_factory: idea_factory, user: current_user)

        if can?(:like, idea_factory)
            if like.save
                flash.notice = "Idea Factory liked!"
            else
                flash.alert = like.errors.full_messages.join(', ')
            end
        else
            flash.alert = "You can not like this question"
        end
        redirect_to idea_factory_path(idea_factory)
    end

    def destroy
        like = current_user.likes.find params[:id]
        if can?(:destroy, like)
            like.destroy
            flash.notice = "Question Unliked!"
        else
            flash.alert = "Can't unlike it!"
        end
        redirect_to idea_factory_path(like.idea_factory)
    end    
end
