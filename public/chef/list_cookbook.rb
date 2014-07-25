require 'ridley'

server_url = "https://10.98.241.11"
client_name = "admin"
signing_key_filename = "/home/tyagi/chef-repo/chef/admin.pem"
ridley = Ridley.new(server_url: "https://10.98.241.11", client_name: "admin", client_key: "/home/tyagi/chef-repo/chef/admin.pem", ssl: { verify: false}
)
#cookbooks = ridley.cookbook.all
#cookbooks.each do |name|
#cookbook_name = name[0]
#cookbook_version = name[1]
#print "#{cookbook_name}\t\t#{cookbook_version}\n"
#end


#node = ridley.client.all
#node.each do |nodes|
#node_name = nodes[0]
#print "#{node_name}\n"
#end

search = ridley.search(:node, "name:tyagi-windows")
print search
