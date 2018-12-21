module UsersHelper
    def followed(id)
    User.find_by(id: id)
    end
end
