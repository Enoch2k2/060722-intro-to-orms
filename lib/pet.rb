class Pet < ActiveRecord::Base
  def self.search_by_name(term)
    where("LOWER(name) LIKE ?", "%#{ term.downcase }%")
  end
end