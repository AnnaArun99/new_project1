# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  
    def to_s
      "User: #{@name}, Email: #{@email}"
    end
  end
  
  # Example usage:
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  puts user1
  

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user
    end
  
    def to_s
      "Room: #{@name}, Description: #{@description}, Users: #{@users.map(&:name).join(', ')}"
    end
  end
  
  # Example usage:
  class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  end
  
  room1 = Room.new("Study Room", "A quiet place for studying.")
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  user2 = User.new("Bob", "bob@example.com", "anotherpassword")
  
  room1.add_user(user1)
  room1.add_user(user2)
  
  puts room1
  

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "#{@user.name} in #{@room.name}: #{@content}"
    end
  end
  
  # Example usage:
  class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user
    end
  end
  
  # Creating instances for demonstration
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  room1 = Room.new("Study Room", "A quiet place for studying.")
  room1.add_user(user1)
  
  message1 = Message.new(user1, room1, "Hello everyone!")
  puts message1
  

# add a method to user so, user can enter to a room
# user.enter_room(room)
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} has entered the room: #{room.name}."
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    def to_s
      "Room: #{@name}, Description: #{@description}, Users: #{@users.map(&:name).join(', ')}"
    end
  end
  
  # Example usage:
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  room1 = Room.new("Study Room", "A quiet place for studying.")
  
  user1.enter_room(room1)  # Alice enters the room
  puts room1                # Display room information
  
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @password = password
      @sent_messages = []
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} has entered the room: #{room.name}."
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.add_message(message)
      @sent_messages << message
      puts "#{@name} sent a message to #{room.name}: #{content}"
    end
  
    def acknowledge_message(room, message)
      if room.messages.include?(message)
        puts "#{@name} acknowledged the message: '#{message.content}' from #{message.user.name} in #{room.name}."
      else
        puts "Message not found in the room."
      end
    end
  end
  
  class Room
    attr_accessor :name, :description, :users, :messages
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
      @messages = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    def add_message(message)
      @messages << message
    end
  
    def to_s
      "Room: #{@name}, Description: #{@description}, Users: #{@users.map(&:name).join(', ')}"
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "#{@user.name} in #{@room.name}: #{@content}"
    end
  end
  
  # Example usage:
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  user2 = User.new("Bob", "bob@example.com", "anotherpassword")
  room1 = Room.new("Study Room", "A quiet place for studying.")
  
  user1.enter_room(room1)  # Alice enters the room
  user2.enter_room(room1)  # Bob enters the room
  
  user1.send_message(room1, "Hello everyone!")  # Alice sends a message
  user2.send_message(room1, "Hi Alice!")         # Bob sends a message
  
  # Acknowledging messages
  message_to_acknowledge = room1.messages.first
  user2.acknowledge_message(room1, message_to_acknowledge)  # Bob acknowledges Alice's message
  
# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @password = password
      @sent_messages = []
    end
  
    def enter_room(room)
      room.add_user(self)
      puts "#{@name} has entered the room: #{room.name}."
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.add_message(message)
      @sent_messages << message
      room.broadcast(message)  # Broadcast the message to all users
    end
  
    def acknowledge_message(room, message)
      if room.messages.include?(message)
        puts "#{@name} acknowledged the message: '#{message.content}' from #{message.user.name} in #{room.name}."
      else
        puts "Message not found in the room."
      end
    end
  end
  
  class Room
    attr_accessor :name, :description, :users, :messages
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
      @messages = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    def add_message(message)
      @messages << message
    end
  
    def broadcast(message)
      @users.each do |user|
        puts "#{user.name} received a message in #{@name}: '#{message.content}'"
      end
    end
  
    def to_s
      "Room: #{@name}, Description: #{@description}, Users: #{@users.map(&:name).join(', ')}"
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def to_s
      "#{@user.name} in #{@room.name}: #{@content}"
    end
  end
  
  # Example usage:
  user1 = User.new("Alice", "alice@example.com", "securepassword123")
  user2 = User.new("Bob", "bob@example.com", "anotherpassword")
  room1 = Room.new("Study Room", "A quiet place for studying.")
  
  user1.enter_room(room1)  # Alice enters the room
  user2.enter_room(room1)  # Bob enters the room
  
  user1.send_message(room1, "Hello everyone!")  # Alice sends a message
  user2.send_message(room1, "Hi Alice!")         # Bob sends a message
  