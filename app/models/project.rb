class Project < ActiveRecord::Base
  belongs_to :client

  def slug
    self.clientname.downcase.gsub(' ','-')
  end
end
