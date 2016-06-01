set :stage, :production
set :branch, 'master'
role :app, %w{ubuntu@ec2-52-35-188-34.us-west-2.compute.amazonaws.com}

set :ssh_options, {
  forward_agent: false,
  auth_methods: ["publickey"],
  keys: ["/home/Nithin/.ssh/amazon-free-instance.pem"]
}
