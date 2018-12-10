class RelationshipsController < ApplicationController
    
    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        if action_name == "index"
        redirect_to users_path
        else
        redirect_to user
        end
    end

    def destroy
        user = Relationship.find(params[:id]).followed
        current_user.unfollow(user)
        if action_name == "index"
         redirect_to users_path
        else
        redirect_to user
        end
    end

end