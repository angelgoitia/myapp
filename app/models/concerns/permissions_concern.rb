module PermissionsConcern
    extend ActiveSupport::Concern

    def is_admin?
        self.role == "admin"
    end

    def is_user?
        self.role == "estudiante"
    end

    def is_teacher?
        self.role == "profesor"
    end
end