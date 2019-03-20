class Employee
  attr_accessor :name, :email, :country, :city, :years_of_service

  def initialize(name, email, country, city, years_of_service)
    @name = name
    @email = email
    @country = country
    @city = city
    @years_of_service = years_of_service
  end

  def rename(new_name)
    if new_name.length > 0
      @name = new_name
    else
      message = Message.new(@email, @name, 'Invalid user\'s name')
      message.send
    end
  end

  def relocate(new_country, new_city)
    if new_city.length > 0 && new_country.length > 0
      @city = new_city
      @country = new_country

      # Check if the employee deserves to get paid for the relocation
      if @years_of_service > 4 && @country == 'Saudi Arabia'
        # Calculate & pay the relocation fee
        relocation_fee = @years_of_service * 400
        Payment.new(relocation_fee, @email)
      end
    else
      message = Message.new(@email, @name, 'Invalid city/country')
      message.send
    end
  end
end
