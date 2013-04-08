# Create users/groups from node data
node[:users].each_pair do |username, info|

    user username do
        comment info[:full_name]
        shell info[:disabled] ? "/sbin/nologin" : "/bin/bash"
        supports :manage_home => true
        home "/home/#{username}"
    end

    directory "/home/#{username}/.ssh" do
        owner username
        group username
        mode 0700
    end

    file "/home/#{username}/.ssh/authorized_keys" do
        owner username
        group username
        mode 0600
        content info[:key]
    end
end

node[:groups].each_pair do |name, info|
    group name do
        members info[:members]
    end
end
