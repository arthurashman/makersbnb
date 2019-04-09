require 'bcrypt'
#
class User
  attr_reader :id, :email, :fullname

  def initialize(id:, email:, fullname:)
    @id = id
    @email = email
    @fullname = fullname
  end

  def self.create(fullname:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (fullname, email, password) VALUES('#{fullname}', '#{email}', '#{encrypted_password}') RETURNING id, fullname, email;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'])
  end

  def self.find(email:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], email: result[0]['email'])
  end
end
