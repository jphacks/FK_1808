require 'line/bot'

class WebhookController < ApplicationController
    protect_from_forgery except: :callback

    def callback

        date = DateTime.now


        @client ||= Line::Bot::Client.new { |config|
            #config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            #config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
            # ローカルで動かすだけならベタ打ちでもOK
            config.channel_secret = ENV["LINE_CHSNNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        body = request.body.read
        events = @client.parse_events_from(body)
        events
        events.each { |event|
            case event
                when Line::Bot::Event::Message

                case event.type
                    when Line::Bot::Event::MessageType::Text
                    message = {
                        type: 'text',
                        text: event.message['text']
                    }
                    @client.reply_message(event['replyToken'], message)
                    message2 = {
                        type: 'text',
                        text: "ありがとう"
                    }
                    message3 = {
                        type: 'text',
                        text: date
                    }
                    @client.push_message(event['source']['userId'],message2)
                    @client.push_message(event['source']['userId'],message3)
                    when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
                    response = @client.get_message_content(event.message['id'])
                    tf = Tempfile.open("content")
                    tf.write(response.body)
                end
            end
        }
        "OK"
    end

end
