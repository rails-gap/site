namespace :gap do

  desc 'Seeds database'
  task 'seed' => :environment do |t, args|
    # Positions
    puts 'Creating default positions...'
    DEFAULT_POSITIONS.each { |position| Position.where(name: position).first_or_create }
    puts 'Positions created'

    # Users
    puts 'Creating default users...'
    DEFAULT_USERS.each do |user|
      new_user = User
        .where(name: user['name'],
          last_name: user['last_name'],
          email: user['email'],
          level: user['level'],
          employee_type: user['employee_type'],
          location: user['location'])
        .first_or_create
      user['roles'].each { |role| new_user.add_role(role.to_sym) }
    end
    puts 'Users created'

    # Practices
    puts 'Creating default practices...'
    DEFAULT_PRACTICES.each do |practice|
      Practice
        .where(name: practice['name'], description: practice['description'], icon: practice['icon'])
        .first_or_create
    end
    puts 'Practices created'

  end
end
