class RegistrationValidator < Scrivener
  attr_accessor :email, :password

  def validate
    assert_present :email,    [:email, 'must present']
    assert_present :password, [:password, 'must present']
  end
end
