class Link < ApplicationRecord

  def self.reload
    Link.order(id: :desc)
  end

end
