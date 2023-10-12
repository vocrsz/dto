# Ruby DTO
Dumb ruby object, similar a Hash, but provide access to attributes by instance methods
## Instalation
```ruby
gem 'dto', git: 'https://github.com/vocrsz/dto'
```

## Usage
```ruby
class UserDTO < DTO::Base
    attrs :name, :email, :age
end
```

```ruby
user_hash = {
    name:  'Nikita',
    email: 'hello@world.com',
    age:   24,
    some_other_attribute: 'no matter'
}

user = UserDTO.new(user_hash) 
# or UserDTO(name: 'Nikita', email: 'hello@world.com')
```
```ruby
user.name  # "Nikita"
user.email # "hello@world.ru"

user.name = "Not Nikita" # "Not Nikita"
```