class File < ActiveRecord::Base
  belongs_to :project

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(name)
    File.all.find{|file| file.slug == name}
  end
end
