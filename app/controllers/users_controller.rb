class UsersController < ApplicationController
    
    
    def my
    
    end

    def account_setting    
        @setting = AccountSetting.find(user_id: current_user.id)
        
    end
    
end
