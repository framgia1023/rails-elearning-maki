class RelationshipsController < ApplicationController
    
    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        relationships = current_user.active_relationships.find_by(followed_id: user)
        relationships.create_activity(user_id: current_user.id)
        redirect_to request.referer
    end

    def destroy
        user = Relationship.find(params[:id]).followed
        relationships = current_user.active_relationships.find_by(followed_id: user)
        relationships.destroy
        current_user.unfollow(user)
        redirect_to request.referer
    end
    
end