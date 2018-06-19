class TodoList < ApplicationRecord
	belongs_to :user
	has_many :todo_items, :dependent => :delete_all
end
