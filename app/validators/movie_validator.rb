class MovieValidator < Scrivener
  attr_accessor :title, :description, :link

  def validate
    assert_present :title,        [:title, 'must present']
    assert_present :description,  [:description, 'must present']
    assert_present :link,         [:link, 'must present']
  end
end
