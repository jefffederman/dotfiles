Pry.config.prompt = Pry::SIMPLE_PROMPT

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end
