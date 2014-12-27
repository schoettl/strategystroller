ActiveAdmin.register User do
  
  active_admin_importable do |model, hash|
  user = User.find_by_email(hash[:email])
    if user == nil 
      temp_password = SecureRandom.hex
      user = User.new(:username => hash[:username], :email => hash[:email], :password => temp_password, :temp_password => temp_password, 
      :controlling_unit => hash[:controlling_unit], :business_code => hash[:business_code],:active=>hash[:active])
    else
     user.username=hash[:username]
     user.controlling_unit = hash[:controlling_unit]
     user.business_code = hash[:business_code]
     #user.active=hash[:active]
    end
  user.save
    
    #user.send_confirmation_instructions #TODO TEST
    Rails.logger.debug "#{hash.inspect}"
    #model.create!(hash)
  end

  
  
  index do                            
    column :username
    column :email                     
    column :business_code
    column :controlling_unit
    column :confirmation_token  
    column :active        
    default_actions                   
  end                                 

  filter :username
  filter :email
  filter :business_code             
  filter :controlling_unit
  filter :active

  form do |f|                         
    f.inputs "User Details" do       
      f.input :username
      f.input :email                  
      f.input :business_code
      f.input :controlling_unit
      f.input :password               
      f.input :password_confirmation
      f.input :active  
    end                               
    f.actions                         
  end    
end
