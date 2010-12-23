authorization do
  role :admin do
    has_permission_on :messages, :to => [:index, :show, :getcompletemessage, :showrange]
    
    has_permission_on :streams, :to => [:index, :show, :create, :destroy, :setdescription, :setalarmvalues, :togglefavorited, :togglealarmactive, :togglealarmforce, :rules, :analytics, :settings]
    has_permission_on :streamrules, :to => [:create, :destroy]

    has_permission_on :analytics, :to => [:index]

    has_permission_on :hosts, :to => [:index, :show]
    has_permission_on :hostgroups, :to => [:new, :create, :hosts, :index, :settings, :show, :destroy]
    has_permission_on :hostgroup_hosts, :to => [:create]
    
    has_permission_on :blacklists, :to => [:index, :show, :create, :delete]
    has_permission_on :blacklist_terms, :to => [:create, :delete]
    
    has_permission_on :settings, :to => [:index, :store]
    
    has_permission_on :users, :to => [:new, :index, :create, :edit, :delete, :update]
    
    has_permission_on :sessions, :to => [:destroy]
  end
  
  role :reader do
    has_permission_on :streams, :to => [:index, :show, :analytics, :favorite, :unfavorite, :alertable, :get_hosts_statistic] do
      if_attribute :users => contains { user }
    end
    has_permission_on :sessions, :to => [:destroy]
    has_permission_on :messages, :to => [:show]
  end
end

privileges do
end
