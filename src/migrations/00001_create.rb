Sequel.migration do
  change do
    create_table(:posts) do
      String :board, :text => true, :null => false
      primary_key :post_id, :null => false
      Integer :parent, :null => true, :default => nil 
      String :content, :text => true, :null => false
      String :ip, :text => true, :null => true, :default => nil
      TrueClass :is_locked, :default => false
      DateTime :date_posted #, :default => Time.now
      String :title, :text => true
      TrueClass :sticky, :null => false, :default => false
      String :janitor, :text => true, :null => true, :default => nil
      DateTime :last_bumped #, :default => Time.now
    end

    create_table(:bans) do
      # primary_key id
      String :ip, :text => true, :null => false
      String :board, :text => true, :null => false
      DateTime :date_of_unban, :null => false
      String :reason, :text => true
    end

    create_table(:ip_notes) do
      # primary_key id
      String :ip, :text => true, :null => false
      String :content, :text => true, :null => false
      DateTime :created #, :default => Time.now
      String :actor, :text => true, :null => false
    end

    create_table(:archived_posts) do
      primary_key :post_id, :null => false
      String :board, :text => true, :null => false
      String :title, :text => true, :null => false 
    end
  end
end
