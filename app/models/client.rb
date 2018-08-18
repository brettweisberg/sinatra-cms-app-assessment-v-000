class Client < ActiveRecord::Base
  has_many :projects
  has_many :files through: :projects

  has_secure_password
  validates :clientname, presence: true

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(name)
    Client.all.find{|client| client.slug == name}
  end
end
