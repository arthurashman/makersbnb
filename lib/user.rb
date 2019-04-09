require 'bcrypt'
#
class User
  attr_reader :id, :fullname

  def initialize(id:, fullname:)
    @id = id
    @fullname = fullname
  end
#
  def self.create(fullname:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (fullname, email, password) VALUES('#{fullname}', '#{email}', '#{encrypted_password}') RETURNING id, fullname;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'])
  end
end
