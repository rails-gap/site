namespace :gap do

  desc 'Seeds database'
  task 'seed' => :environment do |t, args|
    # Users
    admin_user_params = {
      name: 'Andres Hernandez',
      email: 'ahernandez@growthaccelerationpartners.com',
      active: 1
    }
    admin = User.first_or_create(admin_user_params)
    admin.add_role(:admin)

    # Practices
    practices = ['Rails', 'Java', 'Architecture', 'Agile']
    practices.each do |practice|
      Practice.first_or_create(name: practice)
    end
  end
end
