require 'telegram_bot'
token = '664062211:AAG6LuYbMFzR72S_VqRbv-kD1z45ASYGNSY'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)
  message.reply do |reply|
	case command
	when /start/i
	 reply.text = "I am here to help you. Please use the /helpme command to get help."
	when /helpme/i
	       reply.text = "Hello, #{message.from.first_name}. Try turning it on and off again. You're welcome."
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end


