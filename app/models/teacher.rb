class Teacher < ApplicationRecord
    validates :name, presence: true, length: {minimum: 5}
    validates :career, presence: true, length: {minimum: 5}
    validates :subject, presence: true, length: {minimum: 5}

    include PermissionsConcern
end
