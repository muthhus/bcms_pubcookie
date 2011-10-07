module Pubcookie
  module UserExtensions

    # Called when this module is included on the given class.
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def create_admin_from_netid(netid, options={})
        user = self.create_from_netid(netid, options)
        user.group_ids = ["2","3"]
        return user
      end

      def create_from_netid(netid, email)
        # create a bogus password - pubcookie won't use it
        password = make_token

        params = {
          :login => netid,
          :first_name=> "",
          :last_name => "",
          :email => email,
          :password => password,
          :password_confirmation => password
        }

        return create(params)

      end
    end

  end
end

