Pry.config.prompt = [proc { "> " }, proc { "| " }]

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end
