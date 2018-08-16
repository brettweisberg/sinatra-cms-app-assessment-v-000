class Project < ActiveRecord::Base
  belongs_to :user

  def slug

    self.username.downcase.gsub(' ','-')
  end
end
