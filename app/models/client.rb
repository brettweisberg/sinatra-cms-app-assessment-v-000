class Client < ActiveRecord::Base
  has_many :projects

  has_secure_password
  validates :clientname, presence: true

  def slug
    self.clientname.downcase.gsub(' ','-')
  end

  def self.find_by_slug(clientname)
    Client.all.find{|client| client.slug == clientname}
  end
end
